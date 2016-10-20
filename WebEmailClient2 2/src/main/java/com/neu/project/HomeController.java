package com.neu.project;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.neu.project.dao.UserDAO;
import com.neu.project.model.EmailAccount;
import com.neu.project.model.Messages;
import com.neu.project.model.User;
import com.neu.project.server.EMailData;
import com.neu.project.server.Fetcher;
import com.neu.project.server.SendMail;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory
			.getLogger(HomeController.class);

	@Autowired
	@Qualifier("userValidator")
	private Validator validator;

	@Autowired
	private UserDAO userDao;

	/*
	 * This is to initialize webDataBinder,set its validator as we specify.
	 */
	@InitBinder
	private void initBinder(WebDataBinder binder) {
		binder.setValidator(validator);
	}

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		User user = new User();
		model.addAttribute("user", user);
		return "homePage";
	}

	@RequestMapping(value = "/", method = RequestMethod.POST)
	public String dashboard(Model model, User user, BindingResult result,
			HttpServletRequest request) {
		String returnVal = "home";
		if (result.hasErrors()) {
			return "homePage";
		} else {
			try {
				User u = userDao.queryUserByNameAndPassword(user.getUserName(),
						user.getPassword());
				if (u != null) {
					HttpSession session = request.getSession();
					session.setAttribute("user", u);
					// model.addAttribute("user", u);
					if (user.getUserName().equalsIgnoreCase("admin")) {
						ArrayList<User> users=userDao.getUsers();
						model.addAttribute("users", users);
						return "adminPage";
					} else {
						return returnVal;
					}
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				// return "loginError";
			}
			// return "home";
			return "loginErrorPage";
		}
	}

	@RequestMapping(value = "/userSignup", method = RequestMethod.POST)
	public String userSignup(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(required = false) String q, Model model) {
		String returnVal = "redirect:home";

		try {
			User user = new User();
			String userName = request.getParameter("userName");
			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
			String password = request.getParameter("password");
			String month = request.getParameter("month");
			String day = request.getParameter("day");
			String year = request.getParameter("year");

			Date birthDate = new Date();
			birthDate.setYear(Integer.parseInt(year) - 1900);
			System.out.println(year + "-" + month + "-" + day);
			birthDate.setMonth(Integer.parseInt(month) - 1);
			birthDate.setDate(Integer.parseInt(day));

			String emailPassword = request.getParameter("emailPassword");
			String emailAccount = request.getParameter("emailAccount");
			String gender = request.getParameter("gender");

			user.setUserName(userName);
			user.setFirstName(firstName);
			user.setLastName(lastName);
			user.setPassword(password);
			user.setGender(gender);
			user.setUser_Status("");
			user.setBirthDate(birthDate);
			userDao.saveUser(user);
			EmailAccount account = new EmailAccount();
			account.setEmailAccount(emailAccount);
			account.setEmailPassword(emailPassword);
			account.setUser(user);
			userDao.saveEmailAccount(account);
			
			//EntityManager.flush();
			
			EMailData ed=new EMailData();
			ed.userId = user.getUserID();
            ed.emailAccount = account.getEmailAccount();
            ed.emailPassword = account.getEmailPassword();
            ed.email_id = account.getEmail_Id();
            Fetcher fetcher  = new Fetcher();
            fetcher.getEmails(ed);
            

			HttpSession session = request.getSession();
			session.setAttribute("user", user);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			// return "loginError";
		}
		// return "home";
		return returnVal;

	}

	@RequestMapping(value = "/inbox", method = RequestMethod.GET)
	public String getInbox(Locale locale, Model model,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		ArrayList<Messages> messageList = userDao.getMessages(user.getUserID(),
				"INBOX");
		
		model.addAttribute("messageList", messageList);
		return "inbox";
	}
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String getSearch(Locale locale, Model model,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		String searchWord = request.getParameter("searchWord");
		ArrayList<Messages> messageList = userDao.searchMessages(user.getUserID(),
				searchWord);
		
		model.addAttribute("messageList", messageList);
		return "inbox";
	}

	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public String getDashboard(Locale locale, Model model) {

		return "dashboard";
	}

	@RequestMapping(value = "/SignupPage", method = RequestMethod.GET)
	public String getSignUpPage(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG,
				DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "SignupPage";
	}

	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String getTestPage(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG,
				DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "test";
	}

	@RequestMapping(value = "/drafts", method = RequestMethod.GET)
	public String getDrafts(Locale locale, Model model,
			HttpServletRequest request) {

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		ArrayList<Messages> messageList = userDao.getMessages(user.getUserID(),
				"DRAFTS");
		System.out.println("Messages for userId: " + user.getUserID()
				+ " count:" + messageList.size());
		model.addAttribute("messageList", messageList);
		return "drafts";
	}

	@RequestMapping(value = "/starred", method = RequestMethod.GET)
	public String getStarred(Locale locale, Model model,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		ArrayList<Messages> messageList = userDao.getMessages(user.getUserID(),
				"STARRED");
		System.out.println("Messages for userId: " + user.getUserID()
				+ " count:" + messageList.size());
		model.addAttribute("messageList", messageList);

		return "starred";
	}

	@RequestMapping(value = "/spam", method = RequestMethod.GET)
	public String getSpam(Locale locale, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		ArrayList<Messages> messageList = userDao.getMessages(user.getUserID(),
				"SPAM");
		System.out.println("Messages for userId: " + user.getUserID()
				+ " count:" + messageList.size());
		model.addAttribute("messageList", messageList);

		return "spam";
	}

	@RequestMapping(value = "/trash", method = RequestMethod.GET)
	public String getTrash(Locale locale, Model model,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		ArrayList<Messages> messageList = userDao.getMessages(user.getUserID(),
				"TRASH");
		System.out.println("Messages for userId: " + user.getUserID()
				+ " count:" + messageList.size());
		model.addAttribute("messageList", messageList);

		return "trash";
	}

	@RequestMapping(value = "/outbox", method = RequestMethod.GET)
	public String getOutbox(Locale locale, Model model,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		ArrayList<Messages> messageList = userDao.getMessages(user.getUserID(),
				"Sent Mail");
		System.out.println("Messages for userId: " + user.getUserID()
				+ " count:" + messageList.size());
		model.addAttribute("messageList", messageList);

		return "outbox";
	}

	@RequestMapping(value = "/sendMessage", method = RequestMethod.GET)
	public void sendMail(Locale locale, Model model,
			HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		String receiver = request.getParameter("receiver");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		Messages message = new Messages();
		message.setContent(content);
		message.setDate(new Date());
		ArrayList<EmailAccount> emailAccountsList = new ArrayList(
				Arrays.asList(user.getEmailAccounts().toArray()));
		// message.setSender(((ArrayList<EmailAccount>)user.getEmailAccounts()).get(0).getEmailAccount());
		message.setSender(emailAccountsList.get(0).getEmailAccount());
		message.setReceiver(receiver);
		message.setEmail_Id(emailAccountsList.get(0).getEmail_Id());
		message.setEmail_status("SENT");
		message.setSubject(subject);
//		userDao.saveSentEmail(message);
		SendMail.sendEMail(message, user);

	}

	@RequestMapping(value = "/deleteMessage", method = RequestMethod.GET)
	public void deleteMessage(Locale locale, Model model,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		int id = Integer.parseInt(request.getParameter("id"));
		userDao.deleteMessage(id);

	}
	
	
	
	@RequestMapping(value = "/suspendUser", method = RequestMethod.GET)
	public void suspendUser(Locale locale, Model model,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		int id = Integer.parseInt(request.getParameter("id"));
		userDao.suspendUser(id);

	}


	@RequestMapping(value = "/starredMessage", method = RequestMethod.GET)
	public void starredMessage(Locale locale, Model model,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		int id = Integer.parseInt(request.getParameter("id"));
		userDao.starredMessage(id);

	}

	@RequestMapping(value = "/myProfile", method = RequestMethod.GET)
	public void myProfile(Locale locale, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		model.addAttribute("user", user);

	}
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String myHome(Locale locale, Model model, HttpServletRequest request) {
	return "home";
		
	}
	

	

	@RequestMapping(value="/logout")
	public String showLogout(Model model, HttpServletRequest request){
		HttpSession session = request.getSession();
		session.invalidate();
		User user = new User();
		model.addAttribute("user", user);
		return "redirect:/";
		
	}
	
	@RequestMapping(value = "/help", method = RequestMethod.GET)
	public String getHelp( Model model) {
		User user = new User();
		model.addAttribute("user", user);
		return "help";
	}
	
	
	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public String getAbout( Model model) {
		User user = new User();
		model.addAttribute("user", user);
		return "about";
	}

	
	@RequestMapping(value = "/contactUs", method = RequestMethod.GET)
	public String getContactUs( Model model) {
		User user = new User();
		model.addAttribute("user", user);
		return "contactUs";
	}

	
	
	
	/**
	 * Upload single file using Spring Controller
	 */
	@RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
	public  String uploadFileHandler(@RequestParam("file") MultipartFile file,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");

		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();

				// Creating the directory to store file
//				String rootPath = System.getProperty("catalina.home");
				String webServerRoor="/Users/karishmadalal/Documents/workspace-sts-3.6.4.RELEASE/WebEmailClient2 2/src/main/webapp/resources/images/profilePhotos";
//				File dir = new File(webServerRoor + File.separator + "profilePhotos");
				File dir = new File(webServerRoor);
				if (!dir.exists())
					dir.mkdirs();

				// Create the file on server
				File serverFile = new File(dir.getAbsolutePath()
						+ File.separator + file.getOriginalFilename());
				user.setProfilePicture("resources/images/profilePhotos/"+ file.getOriginalFilename());
				userDao.saveUserProfilePic(user);
				BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();

				logger.info("Server File Location="
						+ serverFile.getAbsolutePath());

				return "redirect:home" ;
			} catch (Exception e) {
				return "You failed to upload " +  " => " + e.getMessage();
			}
		} else {
			return "You failed to upload " 
					+ " because the file was empty.";
		}
	}
	
}

package com.yi.rentcar_project.handler.search;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.model.Customer;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.CustomerService;
import com.yi.rentcar_project.service.SearchIdPwService;

public class SearchPwHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		if (req.getMethod().equalsIgnoreCase("get")) {

			return "/WEB-INF/view/login/searchPw.jsp";
		} else if (req.getMethod().equalsIgnoreCase("post")) {

			try {
				String name = req.getParameter("name");
				String id = req.getParameter("id");
				String email1 = req.getParameter("email1");
				String email2 = req.getParameter("email2");

				CustomerService service = CustomerService.getInstance();
				SearchIdPwService searchService = SearchIdPwService.getInstance();

				Customer customer = new Customer();
				customer.setName(name);

				customer.setId(id);
				customer.setEmail(email1 + "@" + email2);
				Customer custome = service.selectCustomerByIdEmail(customer);

				if (custome.getName().equals(name) || custome.getEmail().equals(email1 + "@" + email2)) {

					String newPwd = searchService.getRandPw();
					customer.setPasswd(newPwd);

					searchService.changePw(customer);

					String newPw = customer.getPasswd();
					req.setAttribute("newPwd", newPw);

					String from = "psw2701";
					String passwd = "swan0303";
					String[] to = { customer.getEmail() }; // 보낼 메일 목록
					String subject = "○○렌터카입니다 비밀번호를 개인정보관리에서 변경해주세요"; // 메일 제목
					String body = "고객님의 임시 비밀번호는 " + customer.getPasswd() + " 입니다 로그인하여 개인정보관리에서 비밀번호를 변경해주세요 "; // 메일

					sendFromGMail(from, passwd, to, subject, body);

				}
			} catch (Exception e) {
				e.printStackTrace();
				String msg = "1";
				req.setAttribute("msg", msg);
				return "/WEB-INF/view/login/searchPw.jsp";
			}
			
			res.sendRedirect("searchRestultPw.do");
			return null;
		}

		return null;
	}

	private static void sendFromGMail(String from, String pass, String[] to, String subject, String body) {
		Properties props = System.getProperties();
		String host = "smtp.gmail.com";
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.user", from);
		props.put("mail.smtp.password", pass);
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.auth", "true");

		Session session = Session.getDefaultInstance(props);
		MimeMessage message = new MimeMessage(session);

		try {
			message.setFrom(new InternetAddress(from));
			InternetAddress[] toAddress = new InternetAddress[to.length];

			// To get the array of addresses
			for (int i = 0; i < to.length; i++) {
				toAddress[i] = new InternetAddress(to[i]);
			}

			for (int i = 0; i < toAddress.length; i++) {
				message.addRecipient(Message.RecipientType.TO, toAddress[i]);
			}

			message.setSubject(subject);
			message.setText(body);
			Transport transport = session.getTransport("smtp");
			transport.connect(host, from, pass);
			transport.sendMessage(message, message.getAllRecipients());
			transport.close();
		} catch (AddressException ae) {
			ae.printStackTrace();
		} catch (MessagingException me) {
			me.printStackTrace();
		}
	}

}

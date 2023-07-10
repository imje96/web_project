package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import repository.AccountInfoRepository;

import java.io.IOException;

/**
 * Servlet implementation class AccountInfoController
 */

@WebServlet({"/view/account.do", "/view/accountCreate.do"})
public class AccountInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AccountInfoController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	 private void actionDo(final HttpServletRequest request, final HttpServletResponse response)
	            throws ServletException, IOException {
	        String viewPage = null;
	        String uri = request.getRequestURI();
	        System.out.println("uri : " + uri);

	        String conPath = request.getContextPath();
	        System.out.println("conPath : " + conPath);

	        String command = uri.substring(conPath.length());
	        System.out.println("command : " + command);

	        if(command.equals("/view/account.do")) {
	        	
	        	System.out.println("account.do");
	        
	            String memberId = request.getParameter("memberId");
	            String accountPassword = request.getParameter("accountPassword");
	            String nickname = request.getParameter("nickname");
	            int accountType = Integer.parseInt(request.getParameter("accountType"));
	            AccountInfoRepository.createAccount(memberId, accountPassword, nickname, accountType);
	            viewPage = "success.jsp";
	        } else {
	            System.out.println("잘못된 command");
	            viewPage = "error.jsp"; // 또는 다른 적절한 에러 페이지로 초기화
	        }

	        RequestDispatcher reqDpt = request.getRequestDispatcher(viewPage);
	        reqDpt.forward(request, response);
	    }
	}
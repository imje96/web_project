package model;

import java.io.IOException;

import daodto.AccountDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class checkIdCommand implements accountCommand {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        String uId =request.getParameter("id");
        AccountDao dao = new AccountDao();
        boolean ckResult =dao.checkId(uId);
        System.out.println(ckResult + ": excute 실행");
        request.setAttribute("ckResult", ckResult);
      
              
    }

}

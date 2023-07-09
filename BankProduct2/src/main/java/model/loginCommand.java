package model;

import java.io.IOException;

import daodto.AccountDao;
import daodto.AccountDto;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class loginCommand implements accountCommand {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String id = request.getParameter("id");
        String pw = request.getParameter("pw");
        System.out.println(id);
        System.out.println(pw);
        AccountDao dao = new AccountDao();
        AccountDto dto = dao.memberLoginCheck(id,pw);
        System.out.println(dto);
          
        if(dto == null) {
            
            request.setAttribute("loginResult", false);           
        
        }else {
           
            request.setAttribute("dto", dto);
            request.setAttribute("loginResult", true);
        }

    }

}

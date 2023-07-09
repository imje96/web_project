package model;

import java.io.IOException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface accountCommand {
    void execute(HttpServletRequest request, HttpServletResponse response) throws IOException;
}

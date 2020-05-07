package app.servlets;

import java.io.*;
import javax.servlet.*;

    public class FormEncodingSetterFilter implements Filter{

        @Override
        public void init(FilterConfig filterConfig) throws ServletException {
        }

        @Override
        public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
            request.setCharacterEncoding("UTF-8");
            chain.doFilter(request, response);
        }

        @Override
        public void destroy() {
        }
    }


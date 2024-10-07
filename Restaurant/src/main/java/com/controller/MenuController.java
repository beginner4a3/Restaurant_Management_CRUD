package com.controller;

import com.dao.MenuDAO;
import com.model.MenuItem;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/")
public class MenuController extends HttpServlet {
    
    private static final long serialVersionUID = 1L;
    private MenuDAO menuDAO;

    public void init() {
        menuDAO = new MenuDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            switch (action) {
                case "/new":
                    showNewForm(request, response);
                    break;
                case "/insert":
                    insertItem(request, response);
                    break;
                case "/delete":
                    deleteItem(request, response);
                    break;
                case "/edit":
                    showEditForm(request, response);
                    break;
                case "/update":
                    updateItem(request, response);
                    break;
                case "/searchById":
                    searchItemById(request, response);
                    break;
                case "/list":
                    listItems(request, response);
                    break;
                default:
                    indexPage(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void indexPage(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);
    }

    private void listItems(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<MenuItem> listItems = menuDAO.selectAllMenuItems();
        request.setAttribute("listItems", listItems);
        RequestDispatcher dispatcher = request.getRequestDispatcher("displayItems.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<String> categories = menuDAO.getCategories();
        request.setAttribute("categories", categories);
        RequestDispatcher dispatcher = request.getRequestDispatcher("addItem.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        MenuItem existingItem = menuDAO.selectMenuItemById(id);
        List<String> categories = menuDAO.getCategories();

        request.setAttribute("menuItem", existingItem);
        request.setAttribute("categories", categories);

        RequestDispatcher dispatcher = request.getRequestDispatcher("editItem.jsp");
        dispatcher.forward(request, response);
    }

    private void insertItem(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String category = request.getParameter("category");
        String description = request.getParameter("description");
        String quantityType = request.getParameter("quantityType");

        MenuItem newItem = new MenuItem(0, name, price, category, description, quantityType);
        menuDAO.insertMenuItem(newItem);
        response.sendRedirect("list"); 
    }

    private void updateItem(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String category = request.getParameter("category");
        String description = request.getParameter("description");
        String quantityType = request.getParameter("quantityType");

        MenuItem updatedItem = new MenuItem(id, name, price, category, description, quantityType);
        menuDAO.updateMenuItem(updatedItem);
        response.sendRedirect("list");
    }

    private void deleteItem(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        menuDAO.deleteMenuItem(id);
        response.sendRedirect("list");
    }

    private void searchItemById(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        MenuItem foundItem = menuDAO.selectMenuItemById(id);
        request.setAttribute("menuItem", foundItem);
        RequestDispatcher dispatcher = request.getRequestDispatcher("Display-item.jsp"); 
        dispatcher.forward(request, response);
    }

}

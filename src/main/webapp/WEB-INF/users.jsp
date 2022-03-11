<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Users</title>
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </head>
    <body>
       
        
        <div class="container">
             <h1>User Management System</h1>
            <table class="table">
                <thead>
                    <tr>
                        <th>E-mail</th>                                      
                        <th>First Name</th>                                      
                        <th>Last Name</th>
                        <th>Active</th>
                        <th>Role</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="user" items="${users}">
                        <tr>
                            <td>
                                ${user.email}
                            </td>
                            <td>
                                ${user.firstName}
                            </td>
                            <td>
                                ${user.lastName}
                            </td>
                            <td>
                                ${user.active ? "Y" : "N"}
                            </td>
                            <td>
                                ${user.role.name}
                            </td>
                            <td>
                                <a href="user?action=delete&email=${user.email}">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        
        <div class="insert">           
            <form action="user" method="post">
                <h2>Insert User</h2>
                <input type="hidden" name="action" value="add">
                <label for="addEmail">Email:</label> 
                <input type="text" name="addEmail" id="addEmail" value=""><br>
                <label for="addFName">First Name:</label> 
                <input type="text" name="addFName" id="addFName" value=""><br>
                <label for="addLName">Last Name:</label> 
                <input type="text" name="addLName" id="addLName" value=""><br>
                <label for="addPassword">Password:</label> 
                <input type="text" name="addPassword" id="addPassword" value=""><br>
                <label for="addRole">Role:</label> 
                <select name="addRole" id="addRole">
                    <option value="Regular User">Regular User</option>
                    <option value="Company Admin">Company Admin</option>
                    <option value="System Admin">System Admin</option>
                </select>
                
                <button type="submit" >Create User</button>
            </form>
        </div>
        <p>${error}</p>
    </body>
</html>

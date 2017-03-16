<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="tag" uri="/WEB-INF/taglibs/customTaglib.tld" %>

<html>
<t:head title="Пользователи"/>

<body>
<div class="container">

    <h1 class="mb-3">Пользователи</h1>

    <div class="row">
        <div class="col-sm-4">
            <form role="search" class="mb-2" action="/users/search" method="post">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Поиск по имени" name="search">
                    <span class="input-group-btn">
                        <button type="submit" class="btn btn-default">Поиск</button>
                    </span>
                </div>
            </form>
        </div>
        <div class="col-sm-8">
            <a class="btn btn-primary pull-right" href="/addUser">Создать пользователя</a>
        </div>
    </div>


    <table class="table">
        <thead>
        <tr class="cart_menu">
            <th>ID</th>
            <th>Имя</th>
            <th class="text-center">Возраст</th>
            <th class="text-center">Админ?</th>
            <th></th>
            <th></th>
        </tr>
        </thead>

        <c:forEach var="user" items="${users}" varStatus="userItr">
            <tr>
                <td>
                        ${offset + userItr.index + 1}
                </td>
                <td>
                    <p>${user.name}</p>
                </td>
                <td class="text-center">
                    <p> ${user.age}</p>
                </td>
                <td class="text-center">

                    <p>${user.admin ? '<span class="glyphicon glyphicon-ok"></span>' : '<span class="glyphicon glyphicon-remove"></span>'}</p>
                </td>

                <td class="text-center">
                    <form action="/users/edit" method="POST">
                        <input type="hidden" name="userEdit" value="${user.id}">
                        <input type="submit" name="submit" value="Редактировать" class="btn btn-default btn-sm">
                    </form>
                </td>

                <td class="text-center">
                    <form action="/delete" method="POST">
                        <input type="hidden" name="userDeleted" value="${user.id}">
                        <input type="submit" name="submit" value="Удалить" class="btn btn-default btn-sm">
                    </form>
                </td>
            </tr>
        </c:forEach>

    </table>

    <tag:paginate max="15" offset="${offset}" count="${count}" uri="/user-crud" next="&raquo;" previous="&laquo;"/>
</div>


</body>
</html>

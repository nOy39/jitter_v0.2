<#import "parts/common.ftl" as c>
<@c.page>
<h1>${project.getProjectName()}</h1>
<#--TODO Сделать удаление пользователя из доступа к проекту-->
<#--TODO Сделать отправку сообщений пользователям-->
<#--TODO Сделать историю действий пользователей по проекту-->

<table style="width:100%">
    Project Info
    <tr>
        <th>Project name</th>
        <th>Description</th>
        <th>Author</th>
        <th>Created</th>
        <th>Unique_ID</th>
    </tr>
    <tr>
        <td>${project.getProjectName()}</td>
        <td>${project.description?ifExists}</td>
        <td>${project.getAuthor().getUsername()}</td>
        <td>${project.getCreatedDate()}</td>
        <td>${project.getUniqid()}</td>
    </tr>
</table>
<table style="width:100%">
    <tr>
        Users to enable access to Project
        <th></th>
        <th>Users</th>
        <th>FirstName</th>
        <th>LastName</th>
        <th>Email</th>
        <th>Manage</th>
    </tr>
    <tr>
        <td>0</td>
        <td>${project.getAuthor().getUsername()}</td>
        <td>${project.getAuthor().getFirstname()}</td>
        <td>${project.getAuthor().getLastname()}</td>
        <td>${project.getAuthor().getEmail()}</td>
        <td>Author of Project
            <a href="#">send message</a></td>
    </tr>
    <#list users as u>
    <tr>
        <td>${u?index+1}</td>
        <td>${u.getAuthor().getUsername()}</td>
        <td>${u.getAuthor().getFirstname()}</td>
        <td>${u.getAuthor().getLastname()}</td>
        <td>${u.getAuthor().getEmail()}</td>
        <td><a href="#">delete</a>
            <a href="#">send message</a> </td>
    </tr>
    </#list>
</table>
</@c.page>
<#import "parts/common.ftl" as c>

<@c.page>
<h2 style="color: red">${project.prj_name}</h2> </h3>
<form method="post" name="desk/${project.id}/add">
    <input type="text" name="deskName" class="form-control">
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <button type="submit" class="button">Add desk</button>
</form>

<a href="/projects"><<<</a>
<div>

    <#list desks as desk>
        <p>
            <a href="details/${desk.id}">${desk.name}</a>
        <form method="post" action="${desk.id}/note/add">'
            <input type="text" name="addnote" placeholder="Add Note for this Desk">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <button type="submit" class="button">Add note</button>
        </form>
        </p>
    </#list>
</div>
</@c.page>
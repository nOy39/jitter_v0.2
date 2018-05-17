<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">
<@c.page>
<div>
    <span>
      <h2>Hello, ${name?ifExists}!!!</h2>
        <input class="form-control" id="myInput" type="text" placeholder="Search..">
    </span>
</div>

<div>
    <form class="form-inline" method="post" action="/notes/add">

        <input type="text" name="text" class="form-control" placeholder="Search by Text og Tag">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button type="submit" class="btn btn-primary">Add</button>
    </form>
</div>
<form method="post" action="notes/">
    <table class="table table-hover">
        <thead>
        <tr>
            <th>id</th>
            <th scope="col">message</th>
            <th scope="col">date</th>
            <th scope="col">done</th>
            <th>manage</th>
        </tr>
        </thead>
    <#list notes as note>
    <div>
        <tr>
            <p class="text-${note.done?string("mutted","primary")}">
                ${note.done?string("<del>","")}
            <td>${note.done?string("<del>","")}${note.id}${note.done?string("</del>","")}</td>
            <td>${note.done?string("<del>","")}${note.message}${note.done?string("</del>","")}</td>
            <td>${note.done?string("<del>","")}${note.date}${note.done?string("</del>","")}</td>
            </del>
        <#--${note.done},-->
        <#--${note.author}-->
            <td>
                <#if !note.done>
                    <span style="font-size: 150%; color: tomato" class="fas fa-clipboard-list"></span>
                <#else>
                   <span style="font-size: 150%; color: green" class="fas fa-clipboard-check"></span>
                </#if>
            </td>

            </p>
            <td>
                <#if !note.done>
                    <button type="submit" formaction="notes/${note.id}" class="btn btn-outline-light  col-sm-6"><span class="fas fa-check-circle" style="font-size: 150%; color: green"></span></button>
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                <#else>
                    <button type="submit" formaction="notes/delete/${note.id}" class="btn btn-outline-light  col-sm-6"><span class="fas fa-trash-alt" style="font-size: 150%; color: tomato"></span></button>
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                </#if>
                </p>
            </td>
        </tr>
    </div>
    </#list>
    </table>
</form>

</@c.page>

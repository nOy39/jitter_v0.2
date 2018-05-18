<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">
<@c.page>
<div class="py-5" id="search_container">
    <div class="row">
        <div class="container col-xl-10" style="background-image: url('static/img/50p.png'); height: 50px">
            <div></div>
            <form action="/search">
                <div class="input-group col-xl-12" style="position: relative; top: 5px">
                    <input type="text" class="form-control" placeholder="Search" name="search">
                    <div class="input-group-btn">
                        <button class="btn navbar-btn" type="submit" style="background-image: url('static/img/50p.png');">
                            <i class="fas d-inline fa-search"></i>
                        </button>
                    </div>
                </div>
            </form>
            <div></div>
        </div>
    </div>
</div>
    <div>
        <form class="form" method="post" action="/notes/add">
            <div ng-app="">
                <div class="input-group">
                    <input class="form-control" name="text" ng-model="name" ng-trim="false" maxlength="255" type="text" placeholder="Add task...">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <button type="submit" class="btn btn-primary ml-2"><span class="fas fa-plus" style="font-size: 100%; color: white"> ADD</button>
                    </body>
                </div>
                <span>{{255 - name.length}} left</span>
            </div>
        </form>
    </div>
</div>

<div class="container" id="task_table">
    <form method="post" action="notes/">
        <div class="py-5">
            <div class="container">
                <div class="row" style="background-image: url('static/img/50p.png');">
                    <div class="col-md-12">
                        <table class="table text-center">
                            <thead>
                            <tr>
                                <th class="text-light">ID</th>
                                <th class="text-center text-light">Task</th>
                                <th class="text-center text-light">Date</th>
                                <th class="text-light">Status</th>
                                <th class="text-light">Manage</th>
                            </tr>
                            </thead>
                            <tbody>
                                <#list notes as note>
                                <tr>
                                    <td class="text-light text-left">
                                        ${note.done?string("<del>","")}
                                        ${note.id}
                                        ${note.done?string("</del>","")}
                                    </td>
                                    <td class="text-light text-left">
                                        ${note.done?string("<del>","")}
                                        ${note.message}
                                        ${note.done?string("</del>","")}
                                    </td>
                                    <td class="text-light text-left">
                                        ${note.done?string("<del>","")}
                                        ${note.date}
                                        ${note.done?string("</del>","")}
                                    </td>
                                    <td class="text-light text-center">
                                    <#if !note.done>
                                        <span style="font-size: 110%; color: tomato" class="far fa-times-circle"></span>
                                    <#else>
                                        <span style="font-size: 110%; color: green" class="far fa-check-circle"></span>
                                    </#if>
                                    </td>
                                    <td class="text-light text-center">
                                    <#if !note.done>
                                        <a href="notes/${note.id}">
                                            <span class="fas fa-check-circle" style="font-size: 110%; color: green"/>
                                        </a>
                                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                                    <#else>
                                        <a href="/notes/delete/">
                                            <span class="fas fa-trash-alt" style="font-size: 110%; color: tomato"/>
                                        </a>
                                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                                    </#if>
                                    </td>

                                </tr>
                                </#list>
                            </tbody>

                        </table>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>


</@c.page>

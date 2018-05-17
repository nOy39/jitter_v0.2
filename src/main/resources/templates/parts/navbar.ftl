<#include "security.ftl">
<#import "login.ftl" as l>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="/">Jitter Notebook</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="/">Note list</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/note/add">New note</a>
            </li>
            <#if isAdmin>
            <li class="nav-item">
                <a class="nav-link" href="/users">User List</a>
            </li>
            </#if>
            <#if user??>
            <li class="nav-item">
                <a class="nav-link" href="/users/profile">Profilet</a>
            </li>
            </#if>
        </ul>

        <div class="navbar-text mr-3">
            <h7>${name}</h7>
        </div>
        <@l.logout/>

    </div>
</nav>



<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="https://v40.pingendo.com/assets/4.0.0/default/theme.css" type="text/css"> </head>

<body style="background-image: url('C:/Users/admin/Desktop/Pingendo/New Site/backgr.jpg');">
<nav class="navbar navbar-expand-md navbar-dark" style="background-image: url('C:/Users/admin/Desktop/Pingendo/New Site/50p.png');">
    <div class="container">
        <a class="navbar-brand" href="#">
            <i class="fa d-inline fa-lg fa-calendar-check-o"></i>
            <b class="text-nowrap text-capitalize text-light">ToDo</b>
        </a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbar2SupportedContent">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse text-center justify-content-end" id="navbar2SupportedContent">
            <ul class="navbar-nav">
                <li class="nav-item" style="background-image: url('50p.png');">
                    <a class="nav-link" href="#">
                        <i class="fa d-inline fa-lg fa-bookmark-o"></i> Bookmarks</a>
                </li>
                <li class="nav-item ml-1 text-center text-white" style="background-image: url('50p.png');">
                    <a class="nav-link" href="#">
                        <i class="fa d-inline fa-lg fa-envelope my-1"></i> Contacts</a>
                </li>
            </ul>
            <a class="btn navbar-btn ml-2 text-white btn-link" style="background-image: url('50p.png');">
                <i class="fa d-inline fa-lg fa-user-circle-o"></i> Sign in</a>
        </div>
    </div>
</nav>

<#--Старый Main-->

<#--<#list notes as note>-->
<#--<div>-->
<#--<tr>-->
<#--<p class="text-${note.done?string("mutted","primary")}">-->
<#--${note.done?string("<del>","")}-->
<#--<td>${note.done?string("<del>","")}${note.id}${note.done?string("</del>","")}</td>-->
<#--<td>${note.done?string("<del>","")}${note.message}${note.done?string("</del>","")}</td>-->
<#--<td>${note.done?string("<del>","")}${note.dateCreated}${note.done?string("</del>","")}</td>-->
<#--</del>-->
<#--&lt;#&ndash;${note.done},&ndash;&gt;-->
<#--&lt;#&ndash;${note.author}&ndash;&gt;-->
<#--<td>-->
<#--<#if !note.done>-->
<#--<span style="font-size: 150%; color: tomato" class="fas fa-clipboard-list"></span>-->
<#--<#else>-->
<#--<span style="font-size: 150%; color: green" class="fas fa-clipboard-check"></span>-->
<#--</#if>-->
<#--</td>-->

<#--</p>-->
<#--<td>-->
<#--<#if !note.done>-->
<#--<button type="submit" formaction="notes/${note.id}" class="btn btn-outline-light  col-sm-6"><span class="fas fa-check-circle" style="font-size: 150%; color: green"></span></button>-->
<#--<input type="hidden" name="_csrf" value="${_csrf.token}">-->
<#--<#else>-->
<#--<button type="submit" formaction="notes/delete/${note.id}" class="btn btn-outline-light  col-sm-6"><span class="fas fa-trash-alt" style="font-size: 150%; color: tomato"></span></button>-->
<#--<input type="hidden" name="_csrf" value="${_csrf.token}">-->
<#--</#if>-->
<#--</p>-->
<#--</td>-->
<#--</tr>-->
<#--</div>-->
<#---->
<#--</table>-->

<#---->
<#--<div class="container" style="background-size:cover;background-image: url('/static/css/glass4.png')">-->
<#--<div>-->
<#--<span>-->
<#--<h2>Hello, ${name?ifExists}!!!</h2>-->
<#--<div class="input-group my-2">-->
<#--<input class="form-control" id="search" type="text" placeholder="Search..">-->
<#--<input type="hidden" name="_csrf" value="${_csrf.token}">-->
<#--<button type="submit" class="btn btn-primary ml-2"><span class="fas fa-search" style="font-size: 100%; color: white"> Search</button>-->
<#--</div>-->
<#--</span>-->
<#--</div>-->



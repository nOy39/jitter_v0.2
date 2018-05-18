<#include "security.ftl">
<#import "login.ftl" as l>
<nav class="navbar navbar-expand-md navbar-dark" style="background-image: url('static/img/50p.png');">
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
                <li class="nav-item" style="background-image: url('static/img/25p.png');">
                    <a class="nav-link" href="#">
                        <i class="far d-inline fa-lg fa-bookmark"></i> Bookmarks</a>
                </li>
                <li class="nav-item ml-1 text-center text-white" style="background-image: url('static/img/25p.png');">
                    <a class="nav-link" href="#">
                        <i class="fas d-inline fa-envelope my-1"></i> Contacts</a>
                </li>
            </ul>
            <a class="btn navbar-btn ml-2 text-white btn-link" style="background-image: url('static/img/25p.png');">
                <i class="fas d-inline fa-lg fa-user-circle"></i> Sign in</a>
        </div>
    </div>
</nav>



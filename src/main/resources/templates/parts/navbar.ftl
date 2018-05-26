<#include "security.ftl">


<div uk-sticky="sel-target: .uk-navbar-container; cls-active: uk-navbar-sticky; bottom: #transparent-sticky-navbar">
    <nav class="uk-navbar uk-navbar-container uk-margin" uk-navbar style="position: relative; z-index: 980;">

        <div class="uk-navbar-left">
            <a class="uk-navbar-toggle uk-margin-small-left" href="#left-menu-slide" uk-toggle>
                <span uk-navbar-toggle-icon></span>
                <span class="uk-margin-small-left">Menu</span>
            </a>
        </div>

        <div class="uk-navbar-center">
            <div>
                <ul class="uk-navbar-nav">
                    <a class="uk-navbar-item uk-logo" href="#">Jitt3r</a>
                </ul>
            </div></div>

        <div class="uk-navbar-right">
            <div class="uk-navbar-item">
                <div class="uk-inline">
                    <span class="uk-form-icon" uk-icon="icon: search"></span>
                    <input class="uk-input" type="text">
                </div>
                <button class="uk-button uk-button-default">Search</button>
            </div>
        </div>
    </nav>

</div>
<#--Left menu-->
<div id="left-menu-slide" uk-offcanvas="mode: none; overlay: true">
    <div class="uk-offcanvas-bar uk-flex uk-flex-column">

        <ul class="uk-nav uk-nav-primary">
            <li class="uk-active"><a href="/main">Jitt3r</a></li>
            <li><a href="#"><span class="uk-margin-small-right" uk-icon="icon: table"></span> Item</a></li>
            <li><a href="#"><span class="uk-margin-small-right" uk-icon="icon: thumbnails"></span> Project</a></li>
            <li class="uk-nav-divider"></li>
            <li><a href="#"><span class="uk-margin-small-right" uk-icon="icon: trash"></span> Item</a></li>
            <li class="uk-nav-divider"></li>
            <li><a href="#"><span class="uk-margin-small-right" uk-icon="icon: user"></span>Username</a></li>
            <li><a href="#"><span class="uk-margin-small-right" uk-icon="icon: sign-out"></span> Logout</a></li>
            <li class="uk-nav-divider"></li>
            <a href="#"><span class="uk-margin-small-right" uk-icon="icon: google-plus"></a>
            <a href="#"><span class="uk-margin-small-right" uk-icon="icon: github"></a>
            <a href="#"><span class="uk-margin-small-right" uk-icon="icon: user"></a>
        </ul>

    </div>
</div>



<#include "security.ftl">


<nav class="uk-navbar-container uk-margin" uk-navbar>
    <div class="uk-navbar-left">

        <a href="#offcanvas-slide" class="uk-button uk-button-default" uk-toggle>Jitter</a>

        <div id="offcanvas-slide" uk-offcanvas>
            <div class="uk-offcanvas-bar">

                <ul class="uk-nav uk-nav-default">
                    <li class="uk-active"><a href="#">Active</a></li>
                    <li><a href="/projects/add">Add new projects</a></li>
                    <li class="uk-nav-header">Header</li>
                    <li>
                        <a href="/" class="uk-margin-small-right" uk-icon="icon: home; ratio: 0.8"><span>Home</span></a>
                    </li><#if isDeskForm?ifExists>
                    <li class="uk-parent">
                        <a href="#">Project</a>
                        <ul class="uk-nav-sub">
                            <li>
                                <a href="#">${project.getPrj_name()?ifExists}</a>
                                <#list desks as desk>
                                <ul>
                                    <li class=" uk-text-uppercase">${desk.name?ifExists}</a>
                                    </li>
                                    <ul>
                                    <li>
                                            <#list notes as note>
                                                <#if note.desk == desk>
                                                    <li>
                                                        <a href="/notes/{note}">
                                                            <span style="uk-text-left">${note.message?ifExists}</span>
                                                        </a>
                                                    </li>
                                                </#if>
                                            </#list>
                                        </li>
                                    </ul>
                                </ul>
                                </#list>
                                <ul>
                                    <a href="#modal-example" uk-toggle>Add desk...</a>
                                </ul>
                            </li>

                        </ul>
                    </li>
                <#else >
                <li><a href="/projects">Projects</a></li>
                </#if>

                    <li><a href="/main">Messages</a></li>
                    <li class="uk-nav-divider"></li>
<#if user??>
                <li><a href="/users/profile">Profile</a></li>
</#if>
                    <li><a href="#">Item</a></li>

                    <li>
                        <a href="#" class="uk-icon-link uk-margin-small-right" uk-icon="copy">COPY</a>
                    </li>
                    <li>
                        <span>${name}</span>
                    </li>
                    <li class="uk-nav-divider"></li>

                    <a href="https://github.com/nOy39/jitter_v0.2" class="uk-icon-button uk-margin-small-right" uk-icon="github-alt"></a>
                    <a href="" class="uk-icon-button  uk-margin-small-right" uk-icon="facebook"></a>
                    <a href="" class="uk-icon-button" uk-icon="google-plus"></a>

                </ul>
            </div>
        </div>

        <ul class="uk-navbar-nav">
            <li>
                <a href="#">
                    <span class="uk-icon uk-margin-small-right" uk-icon="icon: star"></span>
                    Features
                </a>
            </li>
        </ul>

        <div class="uk-navbar-item">
            <div>Some <a href="#">Link</a></div>
        </div>

        <div class="uk-navbar-item">
            <form action="javascript:void(0)">
                <input class="uk-input uk-form-width-small" type="text" placeholder="Input">
                <button class="uk-button uk-button-default">Button</button>
            </form>
        </div>

    </div>
</nav>



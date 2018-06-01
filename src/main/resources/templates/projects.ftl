<#import "parts/common.ftl" as c>
<@c.page>
<#--TODO сделать интернационализацию-->
    <#if message??>
<div class="uk-width-1-1 uk-grid-match" uk-grid xmlns="http://www.w3.org/1999/html">
    <div class="uk-width-1-1 alert alert-success" role="alert">
        ${message}
    </div>
</div>
    </#if>

<a href="/"><<<</a>


<div class="uk-child-width-1-2@s uk-grid-match" uk-grid>

    <div>
        <div class="uk-card uk-card-default uk-card-hover uk-card-body uk-box-shadow-small uk-box-shadow-hover">
            <div class="uk-card-badge">
                <a href="#modal-add-newproject" uk-icon="icon: plus" uk-toggle></a>
            </div>
            <h3 class="uk-card-title"><a href="#modal-add-newproject" uk-toggle>Create new project...</a></h3>

            <p >Create a new project...</p>
        </div>
    </div>

    <#list projects as project>
    <div>
        <div class="uk-card uk-card-default uk-card-hover uk-card-body uk-box-shadow-small uk-box-shadow-hover">
            <div class="uk-card-badge">

                <#if project.publ>
                <span uk-icon="social" uk-tooltip="Yor project is public"></span>
                </#if>
                <#if project.isShare()>
                <span uk-icon="users" uk-tooltip="Yor project was share for other users"></span>
                </#if>
                <a href="#offcanvas-setting-${project.id}" uk-icon="icon: settings" style="color: " uk-tooltip="Setting" uk-toggle></a>
            </div>
            <h3 class="uk-card-title"><a href="/desk/${project.id}/list/">${project.projectName}</a></h3>

            <p>${project.description?ifExists}</p>
            <small>admin</small>
        </div>

    <#--Раскрывающееся меню-->
        <div class="uk-offcanvas-content">
            <div id="offcanvas-setting-${project.id}" uk-offcanvas="flip: true; overlay: true">
                <div class="uk-offcanvas-bar">
                    <button class="uk-offcanvas-close" type="button" uk-close></button>
                    <h3>${project.getProjectName()}</h3>
                    <hr>
                    <h4>Settings</h4>
                    <hr>
                    <button href="#modal-rename-${project.id}" class="uk-button uk-button-text uk-width-1-1 uk-margin-small-bottom" type="submit" uk-toggle>Rename project</button>
                    <button href="#modal-confirm-${project.id}" class="uk-button uk-button-text uk-width-1-1 uk-margin-small-bottom" type="submit" uk-toggle>Delete project</button>
                    <button href="#modal-share-${project.id}" class="uk-button uk-button-text uk-width-1-1 uk-margin-small-bottom" type="submit" uk-toggle>Invite other user</button>
                    <form method="get" action="/projects/userlist/"></form>
                    <input type="hidden" name="project" value="${project.id}">
                    <a type="submit" href="/projects/userlist/${project.id}" class="uk-button uk-button-text uk-width-1-1 uk-margin-small-bottom" type="submit" ${project.isShare()?string('','disabled')}>List users</a>
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    </form>
                    <button class="uk-button uk-button-text uk-width-1-1 uk-margin-small-bottom" type="submit">вычислить дату</button>
                    <button class="uk-button uk-button-default uk-width-1-1 uk-margin-small-bottom">Button</button>
                </div>
            </div>
        </div>
    <#--Модальное окно приглашения пользователя-->

    <#--Модальное окно удаление проекта-->
        <div id="modal-confirm-${project.id}" uk-modal>
            <div class="uk-modal-dialog uk-modal-body">
                <h2 class="uk-modal-title">Are you sure?</h2>
                <form method="post" name="deleteProject" action="/projects/delete">
                    <p>Please enter project name</p>
                    <input class="uk-input" name="projectName" placeholder="Enter project name">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <input type="hidden" name="project" value="${project.id}">
                    <p class="uk-text-right">
                        <button class="uk-button uk-button-default uk-modal-close" type="button">Cancel</button>
                        <button class="uk-button uk-button-primary" type="submit">Confirm</button>
                    </p>
                </form>
            </div>
        </div>
    <#--Модальное окно приглашения пользователя-->
        <div id="modal-share-${project.id}" uk-modal>
            <div class="uk-modal-dialog uk-modal-body">
                <h2 class="uk-modal-title">Are you sure?</h2>
                <form method="post" name="shareProject" action="/projects/share">
                    <p>Please enter project name</p>
                    <input class="uk-input" name="username" placeholder="Enter user name">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <input type="hidden" name="project" value="${project.id}">
                    <p class="uk-text-right">
                        <button class="uk-button uk-button-default uk-modal-close" type="button">Cancel</button>
                        <button class="uk-button uk-button-primary" type="submit">Confirm</button>
                    </p>
                </form>
            </div>
        </div>
    <#--Модальное окно изменения проекта-->
        <div id="modal-rename-${project.id}" uk-modal>
            <div class="uk-modal-dialog uk-modal-body">
                <h2 class="uk-modal-title">Are you sure?</h2>
                <p>Please enter project name</p>
                <form method="post" name="renameProject" action="/projects/rename">

                    <input class="uk-input" name="projectName" placeholder="${project.projectName}">
                    <input class="uk-input" name="description" placeholder="${project.description}">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <input type="hidden" name="project" value="${project.id}">
                    <p class="uk-text-right">
                        <button class="uk-button uk-button-default uk-modal-close" type="button">Cancel</button>
                        <button class="uk-button uk-button-primary" type="submit">Confirm</button>
                    </p>
                </form>
            </div>
        </div>

    </div>
    </#list>

</div>
<span uk-icon="icon: check"></span>

<a href="" uk-icon="icon: settings"></a>

<div class="uk-child-width-1-2@s uk-grid-match" uk-grid>
    <#list shareProject as share>
        <div>
            <div class="uk-card uk-card-secondary uk-card-hover uk-card-body uk-box-shadow-small uk-box-shadow-hover">
                <div class="uk-card-badge">
                <#--<span uk-icon="icon: ${project.share?string('check','ban')}"-->
                <#--style="color: ${project.share?string('green','red')}" uk-tooltip=${project.share?string('"Enable Project"','"Disable project"')}></span>-->
                <#--<span uk-icon="icon: ${project.publ?string('social','lock')}"-->
                <#--style="color: ${project.publ?string('green','red')}"" uk-tooltip=${project.publ?string('"Public project"','"Private project"')}></span>-->

                    <a href="/projects/setting/${share.project.id}" uk-icon="icon: settings" style="color: " uk-tooltip="Setting"></a>
                </div>
                <h3 class="uk-card-title"><a href="/desk/${share.id}/list/">${share.project.projectName}</a></h3>

                <p>${share.project.description?ifExists}</p>

            </div>
        </div>
    </#list>
</div>

<div id="modal-add-newproject" uk-modal>
    <div class="uk-modal-dialog">
        <button class="uk-modal-close-default" type="button" uk-close></button>
        <div class="uk-modal-header">
            <h2 class="uk-modal-title">Create new project</h2>
        </div>
        <div class="uk-modal-body">
            <form class="uk-form-horizontal uk-margin-large" method="POST" name="add" action="/projects">

                <div class="uk-margin">
                    <label class="uk-form-label" for="form-horizontal-text">Project name:</label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="form-horizontal-text" name="name" placeholder="">
                    </div>
                </div>

                <div class="uk-margin">
                    <label class="uk-form-label" for="form-horizontal-text">Project Description:</label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="form-horizontal-text" name="description" placeholder="">
                    </div>
                </div>

                <div class="uk-margin">
                    <div class="uk-form-label">Share project:</div>
                    <div class="uk-form-controls uk-form-controls-text">
                        <label><input class="uk-radio" type="radio" name="radioIsPublic" value="public"> Public</label><br>
                        <label><input class="uk-radio" type="radio" name="radioIsPublic" value="private" checked> Private</label>
                    </div>
                </div>
                <div>
                    <input type="hidden" value="" name="projectId">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                </div>

                <div class="uk-modal-footer uk-text-right">

                    <button class="uk-button uk-button-default uk-modal-close" type="button">Cancel</button>
                    <button class="uk-button uk-button-primary" type="submit">Create</button>
                </div>
            </form>
        </div>
    </div>
</div>
</@c.page>
<#import "parts/common.ftl" as c>
<@c.page>
<#--TODO сделать расшаривание проекта-->
    <#if message??>
<div class="uk-width-1-1 uk-grid-match" uk-grid>
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
                <span uk-icon="social"></span>
                </#if>
                <a href="#offcanvas-setting-${project.id}" uk-icon="icon: settings" style="color: " uk-tooltip="Setting" uk-toggle></a>
            </div>
            <h3 class="uk-card-title"><a href="/desk/${project.id}/list/">${project.projectName}</a></h3>

            <p>${project.description?ifExists}</p>
        </div>

        <div class="uk-offcanvas-content">
            <div id="offcanvas-setting-${project.id}" uk-offcanvas="flip: true; overlay: true">
                <div class="uk-offcanvas-bar">
                    <button class="uk-offcanvas-close" type="button" uk-close></button>
                    <h3>${project.getProjectName()}</h3>
                    <hr>
                    <h4>Settings</h4>
                    <hr>
                    <a href="#modal-confirm-${project.id}" class="uk-button uk-button-text uk-width-1-1 uk-margin-small-bottom" type="submit" uk-toggle>Delete project</a>
                    <button class="uk-button uk-button-text uk-width-1-1 uk-margin-small-bottom" type="submit">вычислить дату</button>
                    <button class="uk-button uk-button-text uk-width-1-1 uk-margin-small-bottom" type="submit">вычислить дату</button>
                    <button class="uk-button uk-button-default uk-width-1-1 uk-margin-small-bottom">Button</button>
                </div>
            </div>
        </div>

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

    </div>
    </#list>

</div>
<span uk-icon="icon: check"></span>

<a href="" uk-icon="icon: settings"></a>

<div class="uk-child-width-1-2@s uk-grid-match" uk-grid>
    <#list publProjects as project>
        <div>
            <div class="uk-card uk-card-primary uk-card-hover uk-card-body uk-box-shadow-small uk-box-shadow-hover">
                <#--<div class="uk-card-badge">-->
                <#--&lt;#&ndash;<span uk-icon="icon: ${project.isactive?string('check','ban')}"&ndash;&gt;-->
                <#--&lt;#&ndash;style="color: ${project.isactive?string('green','red')}" uk-tooltip=${project.isactive?string('"Enable Project"','"Disable project"')}></span>&ndash;&gt;-->
                <#--&lt;#&ndash;<span uk-icon="icon: ${project.publ?string('social','lock')}"&ndash;&gt;-->
                <#--&lt;#&ndash;style="color: ${project.publ?string('green','red')}"" uk-tooltip=${project.publ?string('"Public project"','"Private project"')}></span>&ndash;&gt;-->

                    <#--<a href="/projects/setting/${project.id}" uk-icon="icon: settings" style="color: " uk-tooltip="Setting"></a>-->
                <#--</div>-->
                <h3 class="uk-card-title"><a href="/desk/${project.id}/list/">${project.projectName}</a></h3>

                <p>${project.description?ifExists}</p>
            </div>
        </div>
    </#list>
</div>

<div class="uk-child-width-1-2@s uk-grid-match" uk-grid>
    <#list shareProject as share>
        <div>
            <div class="uk-card uk-card-secondary uk-card-hover uk-card-body uk-box-shadow-small uk-box-shadow-hover">
                <div class="uk-card-badge">
                <#--<span uk-icon="icon: ${project.isactive?string('check','ban')}"-->
                <#--style="color: ${project.isactive?string('green','red')}" uk-tooltip=${project.isactive?string('"Enable Project"','"Disable project"')}></span>-->
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
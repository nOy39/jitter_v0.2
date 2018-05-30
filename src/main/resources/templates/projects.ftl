<#import "parts/common.ftl" as c>
<@c.page>
<a href="/"><<<</a>

<div class="uk-child-width-1-2@s uk-grid-match" uk-grid>
    <#if messageError??>
        <div class="alert alert-danger" role="alert">
            ${messageError}
        </div>
    </#if>
    <div>
        <div class="uk-card uk-card-default uk-card-hover uk-card-body uk-box-shadow-small uk-box-shadow-hover">
            <div class="uk-card-badge">
                <a href="/projects/add" uk-icon="icon: plus"></a>
            </div>
            <h3 class="uk-card-title"><a href="/projects/add">Create new project...</a></h3>

            <p >Create a new project...</p>
        </div>
    </div>
    <#list projects as project>
    <div>
        <div class="uk-card uk-card-default uk-card-hover uk-card-body uk-box-shadow-small uk-box-shadow-hover">
            <div class="uk-card-badge">
                <#--<span uk-icon="icon: ${project.isactive?string('check','ban')}"-->
                      <#--style="color: ${project.isactive?string('green','red')}" uk-tooltip=${project.isactive?string('"Enable Project"','"Disable project"')}></span>-->
                <#--<span uk-icon="icon: ${project.publ?string('social','lock')}"-->
                      <#--style="color: ${project.publ?string('green','red')}"" uk-tooltip=${project.publ?string('"Public project"','"Private project"')}></span>-->

                <a href="/projects/setting/${project.id}" uk-icon="icon: settings" style="color: " uk-tooltip="Setting"></a>
            </div>
            <h3 class="uk-card-title"><a href="/desk/${project.id}/list/">${project.prj_name}</a></h3>

            <p>${project.description?ifExists}</p>
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
            <div class="uk-card-badge">
            <#--<span uk-icon="icon: ${project.isactive?string('check','ban')}"-->
            <#--style="color: ${project.isactive?string('green','red')}" uk-tooltip=${project.isactive?string('"Enable Project"','"Disable project"')}></span>-->
            <#--<span uk-icon="icon: ${project.publ?string('social','lock')}"-->
            <#--style="color: ${project.publ?string('green','red')}"" uk-tooltip=${project.publ?string('"Public project"','"Private project"')}></span>-->

                <a href="/projects/setting/${project.id}" uk-icon="icon: settings" style="color: " uk-tooltip="Setting"></a>
            </div>
            <h3 class="uk-card-title"><a href="/desk/${project.id}/list/">${project.prj_name}</a></h3>

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
                <h3 class="uk-card-title"><a href="/desk/${share.id}/list/">${share.project.prj_name}</a></h3>

                <p>${share.project.description?ifExists}</p>
            </div>
        </div>
    </#list>
</div>

</@c.page>
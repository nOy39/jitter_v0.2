<#import "parts/common.ftl" as c>
<@c.page>

<h3>Project <i style="color: #111133">${project.getPrj_name()}</i> was created <i>${project.createdDate}</i></h3>
    <#--<form method="post" action="/projects/edit">-->
        <#--<input type="text" name="projectName" value="${project.getProjectName()}">-->
        <#--<input type="hidden" value="${project.id}" name="projectId">-->
        <#--<label class="container" id="public">public-->
            <#--<input type="radio" ${project.public?string('checked="checked"','')} name="radio" value="public">-->
            <#--<span class="checkmark"></span>-->
        <#--</label>-->
        <#--<label class="container">private-->
            <#--<input type="radio" ${project.public?string('','checked="checked"')}name="radio" value="private">-->
            <#--<span class="checkmark"></span>-->
        <#--</label>-->

        <#--<input type="submit" class="button" name="submit">-->

        <#--<input type="hidden" name="_csrf" value="${_csrf.token}">-->
    <#--</form>-->

<#--&lt;#&ndash;<div uk-sticky="offset: 50; top: 100;">&ndash;&gt;-->
    <#--<span uk-icon="home"></span>-->
<#--&lt;#&ndash;</div>&ndash;&gt;-->

<form class="uk-form-horizontal uk-margin-large" method="post" action="/projects/edit/">

    <div class="uk-margin">
        <label class="uk-form-label" for="form-horizontal-text">Project name:</label>
        <div class="uk-form-controls">
            <input class="uk-input uk-width-1-2" id="form-horizontal-text" name="name" placeholder="${project.projectName}">
        </div>
    </div>

    <div class="uk-margin">
        <label class="uk-form-label" for="form-horizontal-text">Project Description:</label>
        <div class="uk-form-controls">
            <input class="uk-input uk-width-1-2" id="form-horizontal-text" name="description" placeholder="${project.description}">
        </div>
    </div>

    <div class="uk-margin">
        <label class="uk-form-label" for="form-horizontal-text">Project UID</label>
        <div class="uk-form-controls">
            <input class="uk-input uk-width-1-2" id="form-horizontal-text" placeholder="${project.uniqid}" disabled>
        </div>
    </div>
    <div>
        <label class="uk-form-label" for="form-horizontal-text">Deadline date:</label>
        <input type="date" class="uk-input uk-form-danger uk-form-width-medium" name="deadline">
    </div>

    <div class="uk-margin">
        <div class="uk-form-label">Share project:</div>
        <div class="uk-form-controls uk-form-controls-text">
            <label><input class="uk-radio" type="radio" ${project.public?string('checked="checked"','')} name="radioIsPublic" value="public"> Public</label><br>
            <label><input class="uk-radio" type="radio" ${project.public?string('','checked="checked"')} name="radioIsPublic" value="private"> Private</label>
        </div>
    </div>
    <div class="uk-margin">
        <div class="uk-form-label">Set active project:</div>
        <div class="uk-form-controls uk-form-controls-text">
            <label><input class="uk-radio" type="radio" ${project.share?string('','checked="checked"')} name="radioIsActive" value="false" disabled> Disable</label><br>
            <label><input class="uk-radio" type="radio" ${project.share?string('checked="checked"','')} name="radioIsActive" value="true" disabled> Enable</label>
        </div>
    </div>
    <div>
        <input type="hidden" value="${project.id}" name="projectId">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button class="uk-button uk-button-primary">Save</button>
    </div>
</form>
</@c.page>
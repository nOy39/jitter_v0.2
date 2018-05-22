<#import "parts/common.ftl" as c>
<@c.page>

<form class="uk-form-horizontal uk-margin-large" method="POST" name="add" action="/projects/add">

    <div class="uk-margin">
        <label class="uk-form-label" for="form-horizontal-text">Project name:</label>
        <div class="uk-form-controls">
            <input class="uk-input uk-width-1-2" id="form-horizontal-text" name="name" placeholder="">
        </div>
    </div>

    <div class="uk-margin">
        <label class="uk-form-label" for="form-horizontal-text">Project Description:</label>
        <div class="uk-form-controls">
            <input class="uk-input uk-width-1-2" id="form-horizontal-text" name="description" placeholder="">
        </div>
    </div>

    <div class="uk-margin">
        <label class="uk-form-label" for="form-horizontal-text">Deadline date:</label>
        <div class="uk-form-controls">
            <input type="date" class="uk-input uk-form-danger uk-form-width-medium" name="deadline" onchange="validate_date()">

        </div>
    </div>

    <div class="uk-margin">
        <div class="uk-form-label">Share project:</div>
        <div class="uk-form-controls uk-form-controls-text">
            <label><input class="uk-radio" type="radio" name="radioIsPublic" value="public"> Public</label><br>
            <label><input class="uk-radio" type="radio" name="radioIsPublic" value="private" checked> Private</label>
        </div>
    </div>
    <div class="uk-margin">
        <div class="uk-form-label">Set active project:</div>
        <div class="uk-form-controls uk-form-controls-text">
            <label><input class="uk-radio" type="radio" name="radioIsActive" value="false" disabled checked> Disable</label><br>
            <label><input class="uk-radio" type="radio" name="radioIsActive" value="true" disabled> Enable</label>
        </div>
    </div>
    <div>
        <input type="hidden" value="" name="projectId">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button class="uk-button uk-button-primary">Save</button>
    </div>
</form>

${messageDateError?ifExists}
</@c.page>
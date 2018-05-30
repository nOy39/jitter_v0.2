<#import "parts/common.ftl" as c>
<#import  "parts/login.ftl" as l>
<@c.page>

<div class="container-fluid text-center">
    <div class="row content">

        <a href="/projects" class="btn-outline-primary">User projects</a>

        <a href="/projects/add" class="btn-outline-primary">Add projects</a>

        <form method="post" enctype="multipart/form-data">

            <div class="uk-margin">
                <span class="uk-text-middle">Here is a text</span>
                <div uk-form-custom>
                    <input type="file">
                    <span class="uk-link">upload</span>
                </div>
            </div>

            <div class="uk-margin" uk-margin>
                <div uk-form-custom="target: true">
                    <input type="file" name="file" id="customFile">
                    <input class="uk-input uk-form-width-medium" type="text" placeholder="Select file" disabled>
                    <input type="hidden" name="_csrf" value="${_csrf.token}" />
                </div>
                <button class="uk-button uk-button-default">Submit</button>
            </div>
        </form>


        <fieldset class="uk-fieldset">


    </div>
</div>

<a href="/chat" class="btn-outline-primary">Chat</a>
    <@l.logout/>


</@c.page>

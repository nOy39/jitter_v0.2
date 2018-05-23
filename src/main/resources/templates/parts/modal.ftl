<#macro page>
<!-- Modal window for delete desk -->
<div>
    <div id="modal-example" uk-modal>
        <div class="uk-modal-body uk-modal-dialog ">
            <button class="uk-modal-close-default" type="button" uk-close></button>
            <h2 class="uk-modal-title">ADD NEW DESK</h2>
            <form method="post" action="/desk/add">

                <div class="uk-margin">
                    <div class="uk-inline">
                        <span class="uk-form-icon" uk-icon="icon: pencil"></span>
                        <input class="uk-input" type="text" name="deskName" placeholder="Desk name...">
                    </div>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <input type="hidden" name="project" value="${project.id}">


                <ul class="uk-grid-small uk-child-width-1-3@s" uk-grid>
                    <li>
                        <div class="uk-card uk-card-default uk-card-body">
                            <label>
                                <input class="uk-radio" type="radio" name="radio" value="default" checked>Default
                            </label>
                        </div>

                    </li>
                    <li>
                        <div class="uk-card uk-card-primary uk-card-body">
                            <label>
                                <input class="uk-radio" type="radio" name="radio" value="primary">Primary
                            </label>
                        </div>
                    </li>
                    <li>
                        <div class="uk-card uk-card-secondary uk-card-body">
                            <label>
                                <input class="uk-radio" type="radio" name="radio" value="secondary">Secondary
                            </label>
                        </div>
                    </li>
                    <li>
                        <button class="uk-button uk-button-primary" type="submit">Save</button>
                    </li>
                </ul>
            </form>
        </div>

    </div>
</div>


</#macro>
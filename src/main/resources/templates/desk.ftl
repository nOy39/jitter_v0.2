<#import "parts/common.ftl" as c>
<#import "parts/modal.ftl" as m>
<@c.page>



<h2 style="color: red">${project.prj_name}</h2>

<form method="post" action="/desk/add">
    <input type="text" name="deskName" class="form-control">
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <input type="hidden" name="project" value="${project.id}">
    <button type="submit" class="button">Add desk</button>
</form>

<a href="/projects"><<<</a>
<div uk-filter="target: .js-filter">

    <ul class="uk-subnav uk-subnav-pill">
        <li class="uk-active" uk-filter-control><a href="#">All</a></li>
        <li uk-filter-control="[data-color='important']"><a href="#">Important</a></li>
        <li uk-filter-control="[data-color='normally']"><a href="#">Normally</a></li>
        <li uk-filter-control="[data-color='complete']"><a href="#">Complete</a></li>
    </ul>

    <ul class="js-filter uk-child-width-1-2 uk-child-width-1-3@m uk-text-center" uk-grid>

        <#list desks as desk>
            <#if desk.complete>
                <li data-color="complete">
                    <div class="uk-card uk-card-secondary uk-card-body">
                        <div class="uk-card-badge uk-position-small uk-position-top-right">
                            <a href="#modal-trash" uk-toggle uk-icon="icon: trash"></a>
                        </div>
                        <div>
                            ${desk.name}
                        </div>
                    </div>
                </li>
            <#--Modal window for delete-->
            <div id="modal-trash" uk-modal xmlns="http://www.w3.org/1999/html">

                <div class="uk-modal-dialog uk-modal-body">
                    <form method="post" action="/desk/delete/" name="delete">
                        <h2 class="uk-modal-title">Delete desk</h2>
                        <p>${desk.name} Are you sure???</p>
                        <p class="uk-text-right">
                            <input type="hidden" name="_csrf" value="${_csrf.token}">
                            <input type="hidden" name="desk" value="${desk.id}">
                            <input type="hidden" name="project" value="${project.id}">
                            <button class="uk-button uk-button-default uk-modal-close" type="button">Cancel</button>
                            <button class="uk-button uk-button-primary" type="submit">Delete</button>
                        </p>
                    </form>
                </div>

            </div>
            <#else >

        <li data-color="${desk.important?string('important','normally')}">
            <div class="uk-card uk-card-${desk.important?string('primary','default')} uk-card-body">
                <div class="uk-card-badge uk-position-small uk-position-top-right">
                    <#if desk.important>
                        <a href="#modal-complete" uk-toggle uk-icon="icon: check"></a>
                    <#else >
                    <a href="#modal-uppriority" name="${desk.id}" uk-toggle uk-icon="icon: star"></a>
                    <a href="#modal-complete" uk-toggle uk-icon="icon: check"></a>
                    <a href="#modal-link" uk-toggle uk-icon="icon: link"></a>
                    </#if>
                </div>
                ${desk.name}
            </div>

            <div id="modal-uppriority" uk-modal>
                <div class="uk-modal-dialog uk-modal-body">
                    <form method="post" action="/desk/uppriority/" name="${desk.id}">
                        <h2 class="uk-modal-title">Priority upper.</h2>
                        <p> ${desk.name} Are you sure???</p>
                        <p class="uk-text-right">
                            <input type="hidden" name="_csrf" value="${_csrf.token}">
                            <input type="hidden" name="desk" value="${desk.id}">
                            <input type="hidden" name="project" value="${project.id}">
                            <button class="uk-button uk-button-default uk-modal-close" type="button">Cancel</button>
                            <button class="uk-button uk-button-primary" type="submit">Save</button>
                        </p>
                    </form>
                </div>
            </div>

            <!-- Modal window for complete desk -->
            <div id="modal-complete" uk-modal>
                <div class="uk-modal-dialog uk-modal-body">
                    <form method="post" action="/desk/complete/" name="complete">
                        <h2 class="uk-modal-title">Compete desk.</h2>
                        <p>${desk.name} completed. Are you sure???</p>
                        <p class="uk-text-right">
                            <input type="hidden" name="_csrf" value="${_csrf.token}">
                            <input type="hidden" name="desk" value="${desk.id}">
                            <input type="hidden" name="project" value="${project.id}">
                            <button class="uk-button uk-button-default uk-modal-close" type="button">Cancel</button>
                            <button class="uk-button uk-button-primary" type="submit">Save</button>
                        </p>
                    </form>
                </div>
            </div>

            <div id="modal-link" uk-modal>
                <div class="uk-modal-dialog uk-modal-body">
                    <form method="post" action="/desk/uppriority/" name="upper">
                        <h2 class="uk-modal-title">Priority upper.</h2>
                        <label>Desk ID: ${desk.id}</label>
                        <p class="uk-text-right">
                            <label>Name desk: ${desk.name}</label>
                            <button class="uk-button uk-button-default uk-modal-close" type="button">Cancel</button>
                        </p>
                    </form>
                </div>
            </div>

        </li>
            </#if>
        </#list>
    </ul>

</div>


</@c.page>
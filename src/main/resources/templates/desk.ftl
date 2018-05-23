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

    <ul class="js-filter uk-child-width-1-2 uk-child-width-1-3@m" uk-grid>

        <#list desks as desk>
            <#if desk.complete>
                <li data-color="complete">
                    <div class="uk-card uk-card-secondary uk-card-body">
                        <div class="uk-card-badge uk-position-small uk-position-top-right">
                            <a href="#modal-trash-${desk.getId()}" uk-toggle uk-icon="icon: trash"></a>
                        </div>
                        <div>
                            <h4><span style="uk-text-lead" class="uk-text-center uk-position-small uk-position-top-left">${desk.name}</span></h4>
                            <ul class="uk-list">
                                <li>
                                    <form method="post" action="/notes/add">
                                        <div class="uk-margin">
                                            <input class="uk-input" type="name" placeholder="Small">
                                            <input type="hidden" name="_csrf" value="${_csrf.token}">
                                            <input type="hidden" name="desk" value="${desk.id}">
                                        </div>
                                    </form>
                                </li>
                        <#list notes as note>
                            <#if note.desk == desk>
                                <li><a href="/notes/{note}"><span style="uk-text-left">${note.message?ifExists}</span></a></li>
                            </#if>
                        </#list>
                            </ul>

                        </div>
                    </div>
                </li>
            <#--Modal window for delete-->
            <div id="modal-trash-${desk.getId()}" uk-modal xmlns="http://www.w3.org/1999/html">

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
                        <a href="#modal-complete-${desk.getId()}" uk-toggle uk-icon="icon: check"></a>
                    <#else >
                    <a href="#modal-uppriority-${desk.getId()}" name="${desk.id}" uk-toggle uk-icon="icon: star"></a>
                    <a href="#modal-complete-${desk.getId()}" uk-toggle uk-icon="icon: check"></a>
                    <a href="#modal-link-${desk.getId()}" uk-toggle uk-icon="icon: link"></a>

                    <div id="modal-uppriority-${desk.getId()}" uk-modal>
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
                    <div id="modal-complete-${desk.getId()}" uk-modal>
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

                    </#if>
                </div>
                <div>
                    <h4><span style="uk-text-lead" class="uk-text-center uk-position-small uk-position-top-left">${desk.name}</span></h4>
                    <ul class="uk-list">
                        <li>
                            <form method="post" action="/notes/add">
                                <div class="uk-margin">
                                    <input class="uk-input" type="name" placeholder="Small">
                                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                                    <input type="hidden" name="desk" value="${desk.id}">
                                </div>
                            </form>
                        </li>
                        <#list notes as note>
                            <#if note.desk == desk>
                                <li><a href="/notes/{note}"><span style="uk-text-left">${note.message?ifExists}</span></a></li>
                            </#if>
                        </#list>
                    </ul>
                </div>
            </div>
        </li>

            </#if>

        </#list>
    </ul>

</div>


</@c.page>
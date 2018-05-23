<#import "parts/common.ftl" as c>
<#import "parts/modal.ftl" as m>
<@c.page>

<#--Название проекта-->
<div class="uk-text-uppercase uk-text-large uk-text-primary uk-text-center" xmlns="http://www.w3.org/1999/html">
    <span>${project.getPrj_name()}</span>
</div>
<#--Модальное окно добавление доски-->
<div uk-filter="target: .js-filter">

    <ul class="uk-subnav uk-subnav-pill">
        <li class="uk-active" uk-filter-control><a href="#">All</a></li>
        <li uk-filter-control="[data-color='primary']"><a href="#">primary</a></li>
        <li uk-filter-control="[data-color='secondary']"><a href="#">secondary</a></li>
        <li uk-filter-control="[data-color='default']"><a href="#">default</a></li>
    </ul>

    <ul class="js-filter uk-child-width-1-2 uk-child-width-1-3@m" uk-grid>

        <#list desks as desk>

                <li data-color="${desk.classStyle?ifExists}">
                    <div class="uk-card uk-card-${desk.classStyle} uk-card-body">
                        <div>
                            <h4><span style="uk-text-lead" class="uk-text-center uk-position-small uk-position-top-left  uk-text-uppercase">${desk.name}</span></h4>
                            <ul class="uk-list">
                                <li>
                                    <form method="post" action="/notes/add">
                                        <div class="uk-margin">
                                            <input class="uk-input" name="noteName" placeholder="New note...">
                                            <input type="hidden" name="_csrf" value="${_csrf.token}">
                                            <input type="hidden" name="project" value="${project.id}">
                                            <input type="hidden" name="desk" value="${desk.id}">
                                        </div>
                                    </form>
                                </li>
                                    <#list notes as note>
                                        <#if note.desk == desk>
                                            <li>
                                                <a href="/notes/{note}"><span style="uk-text-left">${note.message?ifExists}</span></a>
                                            </li>
                                        </#if>
                                    </#list>
                            </ul>

                        </div>
                    </div>
                </li>
        </#list>
    </ul>
</div>>
<@m.page>

</@m.page>
</@c.page>
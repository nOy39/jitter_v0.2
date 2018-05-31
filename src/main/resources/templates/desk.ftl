<#import "parts/common.ftl" as c>
<#import "parts/modal.ftl" as m>
<#include "parts/security.ftl">
<@c.page>

<#--Название проекта-->
<div class="uk-text-uppercase uk-text-large uk-text-primary uk-text-center" xmlns="http://www.w3.org/1999/html">
    <span>${project.projectName}</span>

<#--отображение досок -->
<div uk-filter="target: .js-filter">
<#--Сортировка-->
    <ul class="uk-subnav uk-subnav-pill">
        <#if name == project.author.username>
        <li><a href="#modal-${project.id}" uk-toggle>addnewdesk</a> </li>
        </#if>
        <li class="uk-active" uk-filter-control><a href="#">All</a></li>
        <li uk-filter-control="[data-color='primary']"><a href="#">primary</a></li>
        <li uk-filter-control="[data-color='secondary']"><a href="#">secondary</a></li>
        <li uk-filter-control="[data-color='default']"><a href="#">default</a></li>

    </ul>
<#--Отображение отсортированных значений-->
    <ul class="js-filter uk-child-width-1-2 uk-child-width-1-3@m" uk-grid>
        <#--Цикл пробега по коллекции desk-->
        <#list desks as desk>
            <li data-color="${desk.classStyle?ifExists}">
                <div class="uk-card uk-card-${desk.classStyle} uk-card-body">
                    <div>
                        <h4>
                            <span style="uk-text-lead"
                                  class="uk-text-center uk-position-small uk-position-top-left  uk-text-uppercase">
                                ${desk.name}
                            </span>
                        </h4>
                        <ul class="uk-list">
                            <#if name == project.author.username>

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
                                </#if>
                            <#--Цикл пробега по коллекции notes-->
                             <#list notes as note>
                                 <#if note.desk == desk>
                                     <li>
                                         <a href="/notes/${note.id}">
                                             <span style="uk-text-left">${note.name?ifExists}</span>
                                         </a>
                                     </li>
                                 </#if>
                             </#list>
                        </ul>
                    </div>
                </div>
            </li>
        </#list>
    </ul>
</div>
<div>

<#--Модальное окно добавление доски-->

    <div id="modal-${project.id}" uk-modal>
        <div class="uk-modal-dialog uk-modal-body">
            <form name="add" method="post" action="/desk/add">
            <h2 class="uk-modal-title">Adding new desk</h2>
                <div class="uk-margin">
                    <label class="uk-form-label" for="form-stacked-text">Deskname</label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="form-stacked-text" type="text" name="deskName" placeholder="Enter deskname...">
                    </div>
                </div>
                <div class="uk-margin">
                    <label class="uk-form-label" for="form-stacked-select">Select style</label>
                    <div class="uk-form-controls">
                        <select class="uk-select" id="form-stacked-select" name="style">
                            <option>primary</option>
                            <option>secondary</option>
                            <option>default</option>
                        </select>
                    </div>
                </div>
            <p class="uk-text-right">
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <input type="hidden" name="project" value="${project.id}">
                <button class="uk-button uk-button-default uk-modal-close" type="button">Cancel</button>
                <button class="uk-button uk-button-primary" type="submit">Save</button>
            </p>
            </form>
        </div>
    </div>

    <@m.page>

    </@m.page>
</@c.page>
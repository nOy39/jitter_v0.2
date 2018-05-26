<#macro page>
     <!-- Модальное окно коментирования -->

                        <div id="modal-example" uk-modal>
                            <div class="uk-modal-dialog uk-modal-body">
                                <h2 class="uk-modal-title">Comments notes</h2>
                                <p class="uk-text-right">
                                <form method="post" action="/notes/comment">
                                    <textarea class="uk-textarea" id="comment-field" rows="4" placeholder="" name="textarea"></textarea>
                                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                    <input type="hidden" name="note" value="${note.id}"/>
                                    <button class="uk-button uk-button-default uk-modal-close" type="button">Cancel</button>
                                    <button class="uk-button uk-button-primary" type="submit">Save</button>
                                </form>
                                </p>
                            </div>
                        </div>
                        <!-- Модальное окно ответа -->
                        <div id="modal-reply-${comment.id}" uk-modal>
                            <div class="uk-modal-dialog uk-modal-body">
                                <h2 class="uk-modal-title">Reply comments</h2>
                                <p class="uk-text-right">
                                <form method="post" action="/notes/comment">
                                    <textarea class="uk-textarea" id="comment-field" rows="4" placeholder="" name="textarea"></textarea>
                                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                    <input type="hidden" name="note" value="${note.id}"/>
                                    <button class="uk-button uk-button-default uk-modal-close" type="button">Cancel</button>
                                    <button class="uk-button uk-button-primary" type="submit">Save</button>
                                </form>
                                </p>
                            </div>
                        </div>
</#macro>
<#import "block/main.ftlh" as main />
<@main.renderWith scripts=[]>
    <h1>Редактирование задачи</h1>
    <#list posts as el >
        <div class="container mt-5 mb-5">
            <form method="post">
                <input type="text" value="${el.title}" name="title" placeholder="Введите название" class="form-control"><br>

                <input type="text" value="${el.dateTime}" name="date" class="form-control"><br>

                <textarea name="full_text" placeholder="Введите текст"
                          class="form-control">${el.fullText}</textarea><br>
                <button type="submit" class="btn btn-success">Отредактирвать</button>
            </form>
        </div>
    </#list>
</@main.renderWith>
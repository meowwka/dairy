<#import "block/main.ftlh" as main />
<@main.renderWith scripts=[]>
    <div class="container mt-5 mb-5">
        <h1>Добавление новой задачи</h1>
        <#if ucant??>
            <h4>Вы не можете создать задачу для прошлого времени</h4>
        <#else >
            <div></div>
        </#if>
        <form action="/blog/add" method="post" class="mx-left" style="width: 50rem">
            <input type="text" name="title" placeholder="Введите название" class="form-control"><br>
            <input type="date" name="date" class="form-control"><br>
            <textarea name="full_text" placeholder="Введите текст" class="form-control"></textarea><br>
            <button type="submit" class="btn btn-success">Добавить</button>
        </form>
    </div>
</@main.renderWith>
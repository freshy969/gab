{if $new_name == ""}{$new_name = "Thread"}{/if}
<div id="new_thread">
    {if $new_name == "Thread"}
        <form action="/#new_{$new_name|lower}" method="post" class="savable">
    {elseif $new_name == "Category"}
        <form action="categories/#new_{$new_name|lower}" method="post" class="savable">
    {/if}
        <h3>New {$new_name}</h3>
        {if $posterror}
            <ul class="errors">
                {foreach $posterrors as $errors}
                    <li>{$errors}</li>
                {/foreach}
            </ul>
        {/if}
        <div class="warning"></div>
         <label>
            {if $new_name == "Message"}To:{/if}
            {if $new_name == "Category"}Name:{/if}
            <input type="text" name="title" id="new_thread_title" /><br />
            {if $new_name == "Thread" && count($categories) > 0}
            {foreach $categories as $category}
                <input type="radio" name="category" id="category_picker cat{$category@index}" value="{$category.id}" />
                <label for="category_picker cat{$category@index}">
                    <a class="category {$category.title|replace:" ":"_"}">
                        {$category.title}
                    </a>
                </label>
            {/foreach}
            {/if}
        </label><br />
        <label>
            {if $new_name == "Category"}Description:
            <input type="text" name="description" id="new_category_description" />
            {else}
            {if $new_name == "Message"}Message:{/if}
            <textarea name="text"></textarea>
            {/if}
        </label>
        <div id="save_warning"></div>
        <input type="hidden" name="do" value="forum_new_{$new_name|lower}" />
        <div id="preview">
        </div>
        <input type="text" name="title_b" class="text_b" disabled="disabled" />
        <input type="submit" class="submit" value="Submit">
    </form>
</div>
{extends 'base/forumbase.tpl'}

{block "forum"}
<div id='categories_page'>
    {foreach $categories as $category}
            <table class="category_table">
                <thead>
                <tr>
                    <th colspan="3">
                        {if $category.title}
                        <a href='{$base_url}/category/{$category.title|escape}' class="category"
                           title="{$category.message}">
                            {$category.title}
                        </a>
                        {/if}
                    </th>
                 </tr>
                 <tr>
                    <th class='Title'>Title</th>
                    <th>Replies</th>
                    <th>Last</th>
                </tr>
                </thead>
                <tbody>
                {foreach from=$category.posts item=post}
                <tr>
                    {foreach $post as $key=>$value}
                        {if $key == 'id'}
                            <td class='{$key}'><a href='{$base_url}/{$value}'>
                                {elseif $key == 'title'}
                                    {$value|escape|truncate:30} </a></td>
                            {elseif $key == 'last_reply'}
                            <td class='{$key}'>
                                {if $value}{block 'category_last_reply'}{$value}{/block}{/if}
                            </td>
                            {else}
                            <td class='{$key}'>{$value|escape}</td>
                        {/if}
                    {/foreach}
                {/foreach}
                </tbody>
            </table>
    {/foreach}
</div>
{/block}

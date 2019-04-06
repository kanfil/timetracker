<script>
  function chLocation(newLocation) { document.location = newLocation; }
</script>

<table cellspacing="0" cellpadding="7" border="0" width="720">
  <tr>
    <td valign="top">
{if $user->can('manage_projects')}
      <table cellspacing="1" cellpadding="3" border="0" width="100%">
  {if $inactive_projects}
        <tr><td class="sectionHeaderNoBorder">{$i18n.form.projects.active_projects}</td></tr>
  {/if}
        <tr>
          <td width="35%" class="tableHeader">{$i18n.label.thing_name}</td>
          <td width="35%" class="tableHeader">{$i18n.label.description}</td>
  {if $show_files}
          <td></td>
  {/if}
          <td></td>
          <td></td>
        </tr>
  {if $active_projects}
    {foreach $active_projects as $project}
        <tr bgcolor="{cycle values="#f5f5f5,#ffffff"}">
          <td>{$project.name|escape}</td>
          <td>{$project.description|escape}</td>
      {if $show_files}
          <td><a href="project_files.php?id={$project.id}"><img class="table_icon" alt="{$i18n.label.files}" src="images/icon_files.png"></a></td>
      {/if}
          <td><a href="project_edit.php?id={$project.id}"><img class="table_icon" alt="{$i18n.label.edit}" src="images/icon_edit.png"></a></td>
          <td><a href="project_delete.php?id={$project.id}"><img class="table_icon" alt="{$i18n.label.delete}" src="images/icon_delete.png"></a></td>
        </tr>
    {/foreach}
  {/if}
      </table>

      <table width="100%">
        <tr>
          <td align="center"><br>
            <form><input type="button" onclick="chLocation('project_add.php');" value="{$i18n.button.add}"></form>
          </td>
        </tr>
      </table>

  {if $inactive_projects}
      <table cellspacing="1" cellpadding="3" border="0" width="100%">
        <tr><td class="sectionHeaderNoBorder">{$i18n.form.projects.inactive_projects}</td></tr>
        <tr>
          <td width="35%" class="tableHeader">{$i18n.label.thing_name}</td>
          <td width="35%" class="tableHeader">{$i18n.label.description}</td>
    {if $show_files}
          <td></td>
    {/if}
          <td></td>
          <td></td>
        </tr>
    {foreach $inactive_projects as $project}
        <tr bgcolor="{cycle values="#f5f5f5,#ffffff"}">
          <td>{$project.name|escape}</td>
          <td>{$project.description|escape}</td>
      {if $show_files}
          <td><a href="project_files.php?id={$project.id}"><img class="table_icon" alt="{$i18n.label.files}" src="images/icon_files.png"></a></td>
      {/if}
          <td><a href="project_edit.php?id={$project.id}"><img class="table_icon" alt="{$i18n.label.edit}" src="images/icon_edit.png"></a></td>
          <td><a href="project_delete.php?id={$project.id}"><img class="table_icon" alt="{$i18n.label.delete}" src="images/icon_delete.png"></a></td>
        </tr>
    {/foreach}
      </table>

      <table width="100%">
        <tr>
          <td align="center"><br>
            <form><input type="button" onclick="chLocation('project_add.php');" value="{$i18n.button.add}"></form>
          </td>
        </tr>
      </table>
  {/if}
{else}
      <table cellspacing="1" cellpadding="3" border="0" width="100%">
        <tr>
          <td class="tableHeader">{$i18n.label.thing_name}</td>
          <td class="tableHeader">{$i18n.label.description}</td>
    {if $show_files}
          <td></td>
    {/if}
        </tr>
  {if $active_projects}
    {foreach $active_projects as $project}
        <tr bgcolor="{cycle values="#f5f5f5,#ffffff"}">
          <td>{$project.name|escape}</td>
          <td>{$project.description|escape}</td>
      {if $show_files}
          <td><a href="project_files.php?id={$project.id}"><img class="table_icon" alt="{$i18n.label.files}" src="images/icon_files.png"></a></td>
      {/if}
        </tr>
    {/foreach}
  {/if}
      </table>
{/if}
    </td>
  </tr>
</table>

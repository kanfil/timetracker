<?php
// +----------------------------------------------------------------------+
// | Anuko Time Tracker
// +----------------------------------------------------------------------+
// | Copyright (c) Anuko International Ltd. (https://www.anuko.com)
// +----------------------------------------------------------------------+
// | LIBERAL FREEWARE LICENSE: This source code document may be used
// | by anyone for any purpose, and freely redistributed alone or in
// | combination with other software, provided that the license is obeyed.
// |
// | There are only two ways to violate the license:
// |
// | 1. To redistribute this code in source form, with the copyright
// |    notice or license removed or altered. (Distributing in compiled
// |    forms without embedded copyright notices is permitted).
// |
// | 2. To redistribute modified versions of this code in *any* form
// |    that bears insufficient indications that the modifications are
// |    not the work of the original author(s).
// |
// | This license applies to this document only, not any other software
// | that it may be combined with.
// |
// +----------------------------------------------------------------------+
// | Contributors:
// | https://www.anuko.com/time_tracker/credits.htm
// +----------------------------------------------------------------------+

require_once('initialize.php');
import('form.Form');
import('ttGroupHelper');

// Access checks.
if (!ttAccessAllowed('manage_advanced_settings')) {
  header('Location: access_denied.php');
  exit();
}
if (!$user->isPluginEnabled('ex')) {
  header('Location: feature_disabled.php');
  exit();
}

$form = new Form('predefinedExpensesForm');

if ($request->isPost()) {
  if ($request->getParameter('btn_add')) {
    // The Add button clicked. Redirect to predefined_expense_add.php page.
    header('Location: predefined_expense_add.php');
    exit();
  }
} else {
  $form->addInput(array('type'=>'submit','name'=>'btn_add','value'=>$i18n->get('button.add')));
  $predefinedExpenses = ttGroupHelper::getPredefinedExpenses();
}

$smarty->assign('forms', array($form->getName()=>$form->toArray()));
$smarty->assign('predefined_expenses', $predefinedExpenses);
$smarty->assign('title', $i18n->get('title.predefined_expenses'));
$smarty->assign('content_page_name', 'predefined_expenses.tpl');
$smarty->display('index.tpl');

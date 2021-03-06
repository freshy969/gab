<?php

if ($_POST['do'] == 'forum_new_category' && $this->user->hasPermission(permission::NEW_CATEGORY)) {

    $data = array(
        "title" => $_POST['title'],
        "description" => $_POST['description'],
        "spam" => $_POST['text_b'],
        "user" => $_SESSION['user_logged_in'],
        "user_name" => $_SESSION['user_name'],
        "user_email_hash" => $_SESSION['user_email_hash'],
    );

    if (!$data['spam'] && $data['title']) {
        if (empty($errors)) {
            $post_id = category::new_category(
                $data['user'],
                $data['user_name'],
                $data['user_email_hash'],
                $data['title'],
                $data['description']
                );

            $this->clearCache("categories");
            $this->clearCache("posts");
            setcookie ("reply_url", "", time() - 3600, "/");
            setcookie ("reply_text", "", time() - 3600, "/");
            header("Location: {$baseurl}/categories");
        } else {
            $GLOBALS['cache_id'] = hash("md4", implode("_", $errors)) . "|" . $GLOBALS['cache_id'];
            $this->assign("posterror", true);
            $this->assign("posterrors", $errors);
        }
    }
}
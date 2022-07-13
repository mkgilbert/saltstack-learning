def users_as_csv():
    """
    Retrieve users from minion and format as CSV

    CLI Example:

    .. code-block:: bash
        salt '*' customuser.users_as_csv
    """
    user_list = __salt__['user.list_users']()
    csv_list = ','.join(user_list)
    return csv_list

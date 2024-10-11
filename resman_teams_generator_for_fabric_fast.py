def generate_terraform_file(names):
    terraform_template = """
    {folder_name} = {{
        name = "{desc_name}"
        iam = {{
            "roles/owner" = [
            "user:{user_email_id}@{your_domain}"
            ]
        }}
    }}
    """

    def modify_name(name):
        parts = name.replace(".", "-").split("-")
        if len(parts) >= 2:
            return parts[0][:2] + parts[1][:2]
        return name[:4]  # Fallback if name doesn't have two parts

    with open("output.tf", "w") as f:
        for name in names:
            folder_name = modify_name(name)
            desc_name = name.replace(".", "-")
            user_email_id = name
            domain = "@whatever.com"
            terraform_code = terraform_template.format(
                folder_name=folder_name,
                user_email_id=user_email_id,
                desc_name=desc_name,
                domain = domain
            )
            f.write(terraform_code)


names_list = ["akos.kohl", "sur.last"]

generate_terraform_file(names_list)

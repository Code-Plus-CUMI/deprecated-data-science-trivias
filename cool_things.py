# ---- NEW USAGE FOR LIST SLICES ----
usernames = [user['key'] for user in users]
names = [user['name'] for user in users]
hashed_passwords = [user['password'] for user in users]

# ---- DICT SLICE ----
users_dict = { 
    'usernames': { 
        user['key']: { 'name': user['name'], 'password': user['password'] } for user in users 
    } 
}

# ---- ZIP AND MORE THAN ONE VARIABLE ON FOR LOOP ----
usernames = ['pparker', 'rmiller']
names = ['Peter Parker', 'Rebecca Miller']
passwords = ['abc123', 'def456']
hashed_passwords = stauth.Hasher(passwords).generate()

for (username, name, hash_password) in zip(usernames, names, hashed_passwords):
	db.insert_user(username, name, hash_password)
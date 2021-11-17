export getchar, set_homedir, get_homedir

const charset = 'a':'z'

getchar(idx) = charset[idx]

const homedir = ["wrong"]

function set_homedir(path)
    global homedir[1] = path
end
get_homedir() = homedir[1]


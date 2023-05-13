with open('message.txt', 'a') as file:
    file.write('This is a message.\n')

with open('message.txt', 'r') as file:
    print(*file.readlines(), sep='', end='')

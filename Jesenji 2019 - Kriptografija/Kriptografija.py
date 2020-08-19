dict = {"HE", "IT", "SOON", "BECAUSE", "HIM", "PLAYING", "CLOSE"}

for l in range(1,19):
    f= open("{}_cyphertext.txt".format(l),"r")
    sadrzina = f.read()
    sadrzina = sadrzina.lower()
    d = open("dr{}resenje.txt".format(l), "a")
    for j in range(1,25):
        tmp = " "
        for i in sadrzina:
            if i != ' ' and i != '\n' and i !=".":
                 ch = (ord(i)-97+j)%26
                 tmp = tmp + chr(ch+65)

            else:
                tmp = tmp + i
        tmp1 = tmp.split(" ")
        for di in dict:
            if di in tmp1:
                d.write(str(j))
                d.write(tmp)
                d.write('\n')
                break

    print(l,"upisano")
    d.close()

    f.close()
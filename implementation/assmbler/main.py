# This is a sample Python script.

# Press ⌃R to execute it or replace it with your code.
# Press Double ⇧ to search everywhere for classes, files, tool windows, actions, and settings.


def main():
    output = []
    dict = {
        'A0': '0001',
        'A1': '0002',
        'A2': '0003',
        'T0': '0004',
        'T1': '0005',
        'T2': '0006',
        'V0': '0007',
        'V1': '0008'
    }
    with open('inst.txt') as f:
        content = f.readlines()
    f.close()
    labels = {}
    count = 0
    c = 0
    output = [0 for i in range(len(content))]
    for line in content:
        inst = line.replace('\n', '')
        inst = inst.replace('\t', '')
        inst = inst.split(':')
        if len(inst) == 2:
            inst[1] = inst[1].split()
            labels[inst[0]] = c
        c += 1
    print(labels)

    f = open("output.txt", "w")

    for line in content:
        inst = line.replace('\n', '')
        inst = inst.replace('\t', '')
        inst = inst.split(':')
        if len(inst) == 2:
            inst[1] = inst[1].split()
            pureInst = inst[1]
        else:
            inst[0] = inst[0].split()
            pureInst = inst[0]
        for i in range(len(pureInst)):
            pureInst[i] = pureInst[i].replace(',', '')
        op = pureInst[0]
        if op == 'li':
            ins = '13'
            ins += '0000'
            ins += dict[pureInst[1]]
            ins += '{0:0{1}X}'.format(int(pureInst[2]), 4)
        elif op == 'allo':
            ins = '1000000000'
            ins += '{0:0{1}X}'.format(int(pureInst[1]), 4)
        elif op == 'sr':
            ins = '1B00000000'
            ins += '{0:0{1}X}'.format(int(pureInst[1]), 4)
        elif op == 'sv':
            ins = '1A'
            ins += dict[pureInst[1]]
            ins += '0000'
            ins += '{0:0{1}X}'.format(int(pureInst[2]), 4)
        elif op == 'ori':
            ins = '17'
            ins += dict[pureInst[2]]
            ins += dict[pureInst[1]]
            ins += '{0:0{1}X}'.format(int(pureInst[3]), 4)
        elif op == 'jal':
            ins = '1F00000000'
            ins += '{0:0{1}X}'.format(int(labels[pureInst[1]]), 4)
        elif op == 'ld':
            ins = '120000'
            ins += dict[pureInst[1]]
            ins += '{0:0{1}X}'.format(int(pureInst[2]), 4)
        elif op == 'beqi':
            ins = '04'
            ins += dict[pureInst[1]]
            ins += '{0:0{1}X}'.format(int(pureInst[2]), 4)
            ins += '{0:0{1}X}'.format(int(labels[pureInst[3]] - 1 - count), 4)
        elif op == 'addi':
            ins = '15'
            ins += dict[pureInst[2]]
            ins += dict[pureInst[1]]
            ins += '{0:0{1}X}'.format(int(pureInst[3]), 4)
        elif op == 'j':
            ins = '1E00000000'
            ins += '{0:0{1}X}'.format(int(labels[pureInst[1]]), 4)
        elif op == 'lr':
            ins = '1400000000'
            ins += '{0:0{1}X}'.format(int(pureInst[1]), 4)
        elif op == 'free':
            ins = '1100000000'
            ins += '{0:0{1}X}'.format(int(pureInst[1]), 4)
        elif op == 'fn':
            ins = '19000000000000'
        elif op == 'bnei':
            ins = '05'
            ins += dict[pureInst[1]]
            ins += '{0:0{1}X}'.format(int(pureInst[2]), 4)
            ins += '{0:0{1}X}'.format(int(labels[pureInst[3]] - 1 - count), 4)
        elif op == 'rtm':
            ins = '1C'
            ins += dict[pureInst[2]]
            ins += dict[pureInst[1]]
            ins += '0000'
        elif op == 'ble':
            ins = '0E'
            ins += dict[pureInst[1]]
            ins += dict[pureInst[2]]
            ins += '{0:0{1}X}'.format(int(labels[pureInst[3]] - 1 - count), 4)
        elif op == 'sub':
            ins = '01'
            ins += dict[pureInst[2]]
            ins += dict[pureInst[3]]
            ins += dict[pureInst[1]]
        else:
            ins = ''
        ins += '00,\n'
        output[count] = ins
        count += 1
        f.write(ins)
    f.close()

# '{0:0{1}X}'.format(42, 2)

if __name__ == '__main__':
    main()

# See PyCharm help at https://www.jetbrains.com/help/pycharm/

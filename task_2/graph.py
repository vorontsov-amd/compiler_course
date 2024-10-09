import matplotlib.pylab as plt

if __name__ == "__main__":
    trace_rec = []
    with open("trace.log", "r") as trace:
        trace_rec = [line.strip("\n") for line in trace.readlines()]
    
    if not trace_rec: 
        print(f"No trace records to present build statistic")
        exit(-1)

    stat = {}
    for indx, trace in enumerate(trace_rec):
        if not trace in stat:
            stat[trace] = 1
        else:
            stat[trace] += 1


    stat = {k: v for k, v in stat.items() if v != 0}

    figure  = plt.figure(figsize=(15, 7))

    y = [int(y) for y in stat.values()]
    x = [str(x) for x in stat.keys()]

    bars = plt.bar(stat.keys(), stat.values())

    for i in range(len(x)):
        plt.text(i, 2 * y[i] // 3, f"{y[i]}", ha="center", rotation=90)

    plt.grid(None, "both", "y")

    plt.title("Call's trace statistic")
    plt.xticks(rotation=45, fontsize=5)

    plt.show()
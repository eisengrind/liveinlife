
import os, argparse

parser = argparse.ArgumentParser(description='list files with language country codes')
parser.add_argument('--in-folder', type=str, metavar='in-folder')
parser.add_argument('--out-file-path', type=str, metavar='out-file-path')
args = parser.parse_args()

with open(args.out_file_path, 'w', encoding='utf-8', errors='ignore') as file:
    file.write("class CfgFaces {\n")
    file.write("\tclass Man_A3 {\n")
    for path in os.listdir(args.in_folder):
        abspath = os.path.join(args.in_folder, path)
        if os.path.isfile(abspath):
            print(path)
            file.write("\t\tclass " + os.path.splitext(path)[0] + " {\n")
            file.write("\t\t\tpreview = PATHTOF(data\\previews\\" + path + ");\n")
            file.write("\t\t};\n\n")
    file.write("\t};\n")
    file.write("};")
    file.close()

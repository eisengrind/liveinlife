
from PIL import Image
import os, argparse

parser = argparse.ArgumentParser(description='list files with language country codes')
parser.add_argument('--in-folder', type=str, metavar='in-folder')
parser.add_argument('--out-folder', type=str, metavar='out-folder')
args = parser.parse_args()

for path in os.listdir(args.in_folder):
    abspath = os.path.join(args.in_folder, path)
    if os.path.isfile(abspath):
        print(path)
        img = Image.open(abspath)
        img = img.crop((570, 130, 1350, 910))
        print(img.size)
        img = img.resize((1024, 1024))
        img = img.convert('RGB')
        img.save(os.path.join(args.out_folder, os.path.splitext(path)[0]) + '.jpg', "JPEG", quality=80, optimize=True, progressive=True)

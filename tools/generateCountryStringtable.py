
import sys, json, argparse
from xml.sax.saxutils import escape

# argv[1] == "en"; argv[2] = "de"; argv[3] =  "fr"
parser = argparse.ArgumentParser(description='list files with language country codes')
parser.add_argument('--loc-en-path', type=str, metavar='loc-en-path')
parser.add_argument('--loc-de-path', type=str, metavar='loc-de-path')
parser.add_argument('--loc-fr-path', type=str, metavar='loc-fr-path')
parser.add_argument('--package-name', type=str, metavar='package-name')
parser.add_argument('--module-name', type=str, metavar='module-name')
parser.add_argument('--out-path', type=str, metavar='out-path')
args = parser.parse_args()

countries = {}

if args.loc_en_path is not None:
    with open(args.loc_en_path, encoding='utf-8') as f:
        enCountries = json.load(f)
        for country in enCountries:
            countries.setdefault(country, {})
            countries[country]["en"] = enCountries[country]
        f.close()

if args.loc_de_path is not None:
    print(args.loc_de_path)
    with open(args.loc_de_path, encoding='utf-8') as f:
        deCountries = json.load(f)
        for country in deCountries:
            countries.setdefault(country, {})
            countries[country]["de"] = deCountries[country]
        f.close()

if args.loc_fr_path is not None:
    with open(args.loc_fr_path, encoding='utf-8') as f:
        frCountries = json.load(f)
        for country in frCountries:
            countries.setdefault(country, {})
            countries[country]["fr"] = frCountries[country]
        f.close()

with open(args.out_path, "w", encoding='utf-8') as f:
    for country in countries:
        print('"' + country + '",')
        langs = countries[country]

        f.write('<Key ID="STR_' + args.package_name + '_' + args.module_name + '_locode_' + country +'">\n')

        enName = langs.get("en")
        if enName is not None:
            f.write('\t<Original>' + escape(enName) + '</Original>\n')
            f.write('\t<English>' + escape(enName) + '</English>\n')

        deName = langs.get("de")
        if deName is not None:
            f.write('\t<German>' + escape(deName) + '</German>\n')

        frName = langs.get("fr")
        if frName is not None:
            f.write('\t<French>' + escape(frName) + '</French>\n')

        f.write('</Key>\n')
    f.close()

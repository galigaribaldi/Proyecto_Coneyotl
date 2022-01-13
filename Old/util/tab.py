"""from reportlab.platypus import SimpleDocTemplate
from reportlab.lib.pagesizes import letter
from reportlab.platypus import Table
##add style
from reportlab.platypus import TableStyle
from reportlab.lib import colors
data = [
    ["Nombre", "Grado", "Edad"],
    ["Roberto Estropajo", "4to", "10"],
    ["Roberto Estropajo", "5to", "11"],
    ["Roberto Estropajo", "6to", "12"]
]

fileName = 'table.pdf'

pdf = SimpleDocTemplate(
    fileName,
    pagesize = letter
)
table = Table(data)

style = TableStyle([
    ##Starting Cell, Ending cell
    ('BACKGROUND',(0,0),(3,0), colors.green),
    ##Starting cell, Ending Cell = (-1,0)
    ('TEXTCOLOR',(0,0),(-1,0), colors.whitesmoke),
    ('ALIGN',(0,0),(-1,-1), 'CENTER'),
    ('FONTNAME',(0,0),(-1,0),'Courier-Bold'),
    ('BOTTOMPADDING',(0,0),(-1,0), 12),
    ('BACKGROUND',(0,1),(-1,-1), colors.beige)
])
table.setStyle(style)
#Alternative Backgroun color
rowNumb = len(data)
for i in range(1, rowNumb):
    if i%2==0:
        bc = colors.burlywood
    else:
        bc = colors.beige
    ts = TableStyle(
        [('BACKGROUND', (0,i),(-1,i),bc)]
    )
    table.setStyle(ts)
##Add Borders
ts = TableStyle(
    [
        ('BOX', (0,0),(-1,-1),2,colors.black),
        ('LINEBEFORE', (2,1),(2,-1),2, colors.red),
        ('LINEABOVE',(0,2),(-1,2),2, colors.green),
        ('GRID', (0,1),(-1,-1),2,colors.black),
    ]
)
table.setStyle(ts)
elems = []
elems.append(table)
pdf.build(elems)
"""
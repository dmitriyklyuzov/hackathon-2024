# Hackathon 2024

## Repository structure

```bash
/.                        # Root directory
├── /infrastructure       # Contains Terraform code for infrastructure setup
│   ├── main.tf           # Main Terraform file
│   ├── variables.tf      # Variables file, if needed
│   └── outputs.tf        # Outputs file, if needed
│
├── /lambda               # Contains Lambda function code
│   ├── index.js          # Lambda handler code (Node.js example)
│   └── package.json      # Dependencies (if needed)
│
├── /static-site          # Contains static website files
│   ├── index.html        # First web page's HTML/CSS/JS
│   ├── result.html       # Second web page's HTML/CSS/JS
│   └── assets            # Any shared assets, like images or CSS files
│
└── README.md             # Project overview and instructions
```

# My Neovim Setup

Neovim is a modern, improved version of Vim—a keyboard-driven text editor built for efficiency. I use Neovim because it’s lightweight, fast, and extremely extensible. Instead of configuring everything from scratch, I use a preconfigured setup called LazyVim.

LazyVim comes with all the essential plugins preinstalled, which means I don’t have to spend hours setting things up manually. It saves a lot of time and effort, especially when you just want a solid environment out of the box. That said, if you prefer building your setup from scratch, it’s not as difficult as it might seem—in fact, it’s quite straightforward once you get the hang of it.

## How to Install LazyVim

To get started with LazyVim, you first need to install Neovim. You can do this easily using your system’s package manager. For example, on Arch Linux:

sudo pacman -S neovim

Next, back up your existing Neovim configuration (if you have one):

mv ~/.config/nvim ~/.config/nvim.bak

Then, clone the LazyVim starter template into your configuration directory:

git clone https://github.com/LazyVim/starter ~/.config/nvim

After that, remove the `.git` directory so you can customize it as your own:

rm -rf ~/.config/nvim/.git

Now, launch Neovim:

nvim

On the first run, LazyVim will automatically install all the required plugins for you.

## Why LazyVim?

What makes this setup stand out is its use of the Lazy package manager. It loads plugins only when they’re actually needed, which keeps startup times fast and the editor responsive.

Since I spend most of my time in the terminal, having a tool that fits seamlessly into that workflow—without the overhead of a traditional IDE—is a big advantage. LazyVim strikes a great balance between performance and functionality.

I personally pair it with the Gruvbox color scheme, which keeps the interface clean and easy on the eyes during long coding sessions.

In the next section, I’ll walk through how I tweak keybindings to make navigation even faster and more intuitive.
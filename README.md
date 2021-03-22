# ffmpeg-scripts
A collection of ffmpeg scripts I'm using to generate gifs and mp4s for (mostly) audioless screencapture videos

## To install (Mac):

I've installed these scripts as `Quick Actions` using MacOS Automator so they can be called by right clicking a file or many files in the Finder and selecting the appropriate action.

- Open Automator
- New Quick Action
- In left pane - select `Actions > Library > Utilities > Run Shell Script`
- In right pane - select `Workflow receives current: files or folders in Finder` and `Pass input as arguments`
- Save - action should now appear in Finder context menu under `Quick Actions`

### To save output to a txt file

- In left pane - select `Text > New TextEdit Document` and drag into action workflow

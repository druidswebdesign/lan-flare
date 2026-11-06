#!/bin/bash

# Colors for better UX
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}=== Git Commit Helper ===${NC}\n"

# Check if there are changes to commit
if [[ -z $(git status -s) ]]; then
    echo -e "${YELLOW}No changes to commit!${NC}"
    exit 0
fi

# Show current status
echo -e "${YELLOW}Current changes:${NC}"
git status -s
echo ""

# Select commit type
echo -e "${GREEN}Select commit type:${NC}"
echo "1) feat     - A new feature"
echo "2) fix      - A bug fix"
echo "3) style    - Changes that do not affect the meaning of the code"
echo "4) docs     - Documentation only changes"
echo "5) refactor - A code change that neither fixes a bug nor adds a feature"
echo "6) perf     - A code change that improves performance"
echo "7) test     - Adding missing tests or correcting existing tests"
echo "8) chore    - Changes to the build process or auxiliary tools"
echo ""

read -p "Enter choice (1-8): " choice

case $choice in
    1) TYPE="feat" ;;
    2) TYPE="fix" ;;
    3) TYPE="style" ;;
    4) TYPE="docs" ;;
    5) TYPE="refactor" ;;
    6) TYPE="perf" ;;
    7) TYPE="test" ;;
    8) TYPE="chore" ;;
    *)
        echo -e "${RED}Invalid choice!${NC}"
        exit 1
        ;;
esac

# Get commit message
echo ""
read -p "Enter commit message: " MESSAGE

if [[ -z "$MESSAGE" ]]; then
    echo -e "${RED}Commit message cannot be empty!${NC}"
    exit 1
fi

# Build commit message
if [[ -z "$SCOPE" ]]; then
    COMMIT_MSG="${TYPE}: ${MESSAGE}"
else
    COMMIT_MSG="${TYPE}(${SCOPE}): ${MESSAGE}"
fi

echo ""
echo -e "${YELLOW}Commit message: ${NC}${COMMIT_MSG}"
echo ""

# Stage all changes
echo -e "${BLUE}Staging all changes...${NC}"
git add .

# Commit
echo -e "${BLUE}Committing...${NC}"
git commit -m "$COMMIT_MSG"

if [[ $? -ne 0 ]]; then
    echo -e "${RED}Commit failed!${NC}"
    exit 1
fi

# Push
echo -e "${BLUE}Pushing to remote...${NC}"
BRANCH=$(git rev-parse --abbrev-ref HEAD)
git push origin "$BRANCH"

if [[ $? -eq 0 ]]; then
    echo ""
    echo -e "${GREEN}✓ Successfully committed and pushed!${NC}"
else
    echo -e "${RED}Push failed! You may need to pull first.${NC}"
    exit 1
fi